//
//  PugCollectionViewCell.swift
//  Solvedex Challenge
//
//  Created by Juan Camilo Argüelles Ardila on 26/01/24.
//

import UIKit

class PugCollectionViewCell: UICollectionViewCell {
    
    public var image: UIImageView = UIImageView()
    public var likesText: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.text = "hoaaaa"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configUI()
    }
    
    private func configUI(){
        let vStack: UIStackView = UIStackView(arrangedSubviews: [image, likesText])
        image.anchor(width: self.frame.width, height: self.frame.height - 80)
        vStack.axis = .vertical
        vStack.spacing = 30
        self.addSubview(vStack)
        vStack.addConstraintsToFillView(view: self)
        likesText.text = "Holaaaa"
    }
}
