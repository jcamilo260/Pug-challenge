//
//  PugCollectionViewCell.swift
//  Solvedex Challenge
//
//  Created by Juan Camilo Argüelles Ardila on 26/01/24.
//

import UIKit

class PugCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    
    public let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let likesText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let iconImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "heart"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        return imageView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    // MARK: - Configuration
    
    private func configureUI() {
        addSubview(vStack)
        vStack.addConstraintsToFillView(view: self)
        image.anchor(height: frame.width)
        iconImage.anchor(width: 50, height: 50)
        likesText.text = "Temp"
    }
    
    // MARK: - Stack Views
    
    private lazy var innerStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [iconImage, likesText])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var vStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [image, innerStack])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10
        return stackView
    }()
}
