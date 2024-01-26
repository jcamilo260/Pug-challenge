//
//  WebUrlProtocol.swift
//  Solvedex Challenge
//
//  Created by Juan Camilo Argüelles Ardila on 26/01/24.
//

import Foundation
protocol WebURLProtocol{
    
    /// Generates url request in a faster way
    /// - Parameter url: the base url
    /// - Returns: returns urlRequest with httpMethod
    func getUrlRequest(url: URL)->URLRequest
}
