//
//  FetchDataService.swift
//  Solvedex Challenge
//
//  Created by Juan Camilo Argüelles Ardila on 26/01/24.
//

import Foundation

class FetchDataService: FetchDataProtocol, WebURLProtocol{
    
    typealias Model = [PugModel]
    private let url: URL = URL(string: Datasource.Services.baseUrl)!
    
    func getUrlRequest(url: URL) -> URLRequest {
        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        return urlRequest
    }
    
    private func performInternRequest(data: Data?, response: URLResponse?, error: Error?, onSuccess: ([PugModel]) -> Void, onFailure: (WebError) -> Void){
        if error != nil{
            onFailure(.unableToPerformRequest)
            return
        }
        
        if let response = response as? HTTPURLResponse,
           response.statusCode != 200{
            onFailure(.unexpectedStatusCode)
            return
        }
        
        guard let data = data else{
            onFailure(.unexpectedNilData)
            return
        }
        
        if let decodedPug = JsonReader.decodeData(data: data, type: PugData.self){
            let pugModels: [PugModel] = decodedPug.message.map {
                PugModel(image: $0)
            }
            onSuccess(pugModels)
        }else{
            onFailure(.unableToConvertData)
            return
        }
    }
    
    func request(onSuccess: @escaping ([PugModel]) -> Void, onFailure: @escaping (WebError) -> Void) {
        
        let urlRequest: URLRequest = getUrlRequest(url: self.url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {[weak self] in
                guard let self = self else {return}
                self.performInternRequest(data: data, response: response, error: error, onSuccess: onSuccess, onFailure: onFailure)
            }
        }
        
        task.resume()
    }
}
