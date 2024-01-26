//
//  MainVCViewModel.swift
//  Solvedex Challenge
//
//  Created by Juan Camilo Argüelles Ardila on 26/01/24.
//

import Foundation
class MainVCViewModel{
    private let fetchService: any FetchDataProtocol
    private var pugs: [PugViewModel]
    public var canReload: ObservableObject<Bool?> = ObservableObject(nil)
    public var error: ObservableObject<String?> = ObservableObject(nil)
    
    init(){
        self.fetchService = FetchDataService()
        self.pugs = []
    }
    
    /// Here we are doing a transformation of the data fetched by the service
    public func fetchPugs(){
        self.fetchService.request { [weak self] pugs in
            guard let self = self,
                  let pugs = pugs as? [PugModel] else {return}
            self.canReload.value = true
            self.pugs += pugs.map({PugViewModel($0)})
            
        } onFailure: { [weak self] webError in
            guard let self = self else {return}
            self.error.value = transformError(error: webError)
        }
    }
    
    /// Amount of pugs in array
    /// - Returns: Returns the current amount of pugs
    public func getPugsCount()->Int{
        return self.pugs.count
    }
    
    /// Error system handling for users
    /// - Parameter error: Error from fetchPugs function
    /// - Returns: Converts the current error into a message
    private func transformError(error: WebError)->String{
        switch error{
        case .unableToConvertData:
            return "Problem with the data"
        case .unableToPerformRequest:
            return "Problem with URL"
        case .unexpectedNilData:
            return "Problem with the response"
        case .unexpectedStatusCode:
            return "Server error"
        }
    }
    
    /// Used for faster viemodel assign
    /// - Parameter index: iindex in pugs array
    /// - Returns:This will provide a viewmodel
    public func getPugViewModel(at index: Int)->PugViewModel{
        return pugs[index]
    }
    
}
