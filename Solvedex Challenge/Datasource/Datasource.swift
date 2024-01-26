//
//  Datasource.swift
//  Solvedex Challenge
//
//  Created by Juan Camilo Argüelles Ardila on 26/01/24.
//

import Foundation
struct Datasource{
    struct Menu{
        public static let title: String = "Pugs"
    }
    struct UICollection{
        public static let cellIdentifier: String = "PugViewCell"
        public static let heartIcon: String = "heart"
        public static let extraHeightSize: CGFloat = 80
    }
    
    struct Services{
        public static let baseUrl: String = "https://dog.ceo/api/breed/pug/images/random/20"
    }
}
