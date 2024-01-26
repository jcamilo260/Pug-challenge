//
//  ViewControllerPreview.swift
//  Solvedex Challenge
//
//  Created by Juan Camilo Argüelles Ardila on 25/01/24.
//

import Foundation
import SwiftUI

struct VCPreview: UIViewControllerRepresentable
{
    let viewControllerBuilder: ()->MainViewController
    init(_ viewControllerBuilder: @escaping()->MainViewController) {
        self.viewControllerBuilder = viewControllerBuilder
    }
    
    func makeUIViewController(context: Context) -> some MainViewController {
        self.viewControllerBuilder()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}
