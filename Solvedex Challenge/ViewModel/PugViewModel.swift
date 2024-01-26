//
//  PugViewModel.swift
//  Solvedex Challenge
//
//  Created by Juan Camilo Argüelles Ardila on 26/01/24.
//

import Foundation
class PugViewModel{
    let image: String
    let likesAmount: String
    
    init(_ pug: PugModel){
        self.image = pug.image
        self.likesAmount = "\(pug.likesAmount) \((pug.likesAmount > 1 ? "likes" : "like"))"
    }
}
