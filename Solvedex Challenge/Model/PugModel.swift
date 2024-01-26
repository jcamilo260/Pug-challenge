//
//  PugModel.swift
//  Solvedex Challenge
//
//  Created by Juan Camilo Argüelles Ardila on 26/01/24.
//

import Foundation
struct PugModel{
    let image: String
    let likesAmount: Int = {
        return Int.random(in: 1...500)
    }()
}
