//
//  FetchDataProtocol.swift
//  Solvedex Challenge
//
//  Created by Juan Camilo Argüelles Ardila on 26/01/24.
//

import Foundation
protocol FetchDataProtocol{
    associatedtype Model
    /// Takes action about the data that comes here'
        /// - Parameters:
        ///   - onSuccess: Completion that handles a positive result
        ///   - onFailure: Completion that handles a negative result
        /// - Returns: No return
        func request(onSuccess: @escaping (Model)->Void, onFailure: @escaping (WebError)->Void) -> Void
}
