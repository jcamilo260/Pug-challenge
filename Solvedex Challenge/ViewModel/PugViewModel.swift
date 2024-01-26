//
//  PugViewModel.swift
//  Solvedex Challenge
//
//  Created by Juan Camilo Argüelles Ardila on 26/01/24.
//

import Foundation
class PugViewModel {
    public let image: String
    public var likesAmount: String
    public var pug: PugModel

    init(_ pug: PugModel) {
        self.pug = pug
        self.image = pug.image
        self.likesAmount = ""
        self.likesAmount = formatLikesString(likes: pug.likesAmount)
    }
    
    /// Choose between saying 1 like or likes
    /// - Parameter likes: the current likes
    /// - Returns: This will return a converted text for like label
    private func formatLikesString(likes: Int) -> String {
        let likesString = "\(likes) \(likes == 1 ? "like" : "likes")"
        return likesString
    }
    
    /// This will increment the amount of likes
    public func incrementLikes() {
        self.pug.likesAmount += 1
        self.likesAmount = formatLikesString(likes: self.pug.likesAmount)
    }
}
