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
    
    public func getPugsCount()->Int{
        return self.pugs.count
    }
    
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
    
    public func getPugViewModel(at index: Int)->PugViewModel{
        return pugs[index]
    }
    
}
