//
//  PugViewModel.swift
//  Solvedex Challenge
//
//  Created by Juan Camilo Argüelles Ardila on 26/01/24.
//

import Foundation
class PugViewModel{
    public let image: String
    public var likesAmount: String
    public var pug: PugModel
    public var sender: ObservableObject<Bool?> = ObservableObject(nil)
    
    init(_ pug: PugModel){
        self.pug = pug
        self.image = pug.image
        self.likesAmount = "\(self.pug.likesAmount) \((self.pug.likesAmount > 1 ? "likes" : "like"))"
    }
    
    private func setLikesAmount(amount: Int){
        self.likesAmount = "\(self.pug.likesAmount) \((self.pug.likesAmount > 1 ? "likes" : "like"))"
    }
    
    public func incrementLikes(){
        self.pug.likesAmount = self.pug.likes + 1
        self.setLikesAmount(amount: self.pug.likesAmount)
        print(self.pug.likesAmount)
        DispatchQueue.main.async {
            self.sender.value = true
        }
    }
}
