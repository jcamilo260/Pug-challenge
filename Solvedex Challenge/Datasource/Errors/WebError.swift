//
//  WebError.swift
//  Solvedex Challenge
//
//  Created by Juan Camilo Argüelles Ardila on 26/01/24.
//

import Foundation
enum WebError:String, Error{
    case unableToPerformRequest
    case unexpectedStatusCode
    case unexpectedNilData
    case unableToConvertData
}
