//
//  PugModel.swift
//  Solvedex Challenge
//
//  Created by Juan Camilo Argüelles Ardila on 26/01/24.
//

import Foundation
struct PugModel {
    let image: String
    var likes: Int

    init(image: String) {
        self.image = image
        self.likes = Int.random(in: 1...500)
    }

    var likesAmount: Int {
        get {
            return likes
        }
        set {
            likes = newValue
        }
    }
}
