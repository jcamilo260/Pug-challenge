//
//  PugCollectionViewCell.swift
//  Solvedex Challenge
//
//  Created by Juan Camilo Argüelles Ardila on 26/01/24.
//

import UIKit
import Kingfisher

class PugCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    public var pugViewModel: PugViewModel?{
        didSet{
            self.configureUI()
        }
    }
    
    public let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    public let heartButton: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleAspectFill
        button.clipsToBounds = true
        button.tintColor = .black
        button.setBackgroundImage(UIImage(systemName: Datasource.UICollection.heartIcon), for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        
        return button
    }()
    
    @objc func buttonTapped(_sender: UIButton) {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            self.pugViewModel?.incrementLikes()
            self.configureUI()
        }
    }
    
    private func subscriptions(){
        self.pugViewModel?.sender.binder({ _ in
            self.configureUI()
            print("meeeeh")
        })
    }
    
    private let likesText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        self.subscriptions()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
        self.subscriptions()
    }
    
    // MARK: - Configuration
    
    private func configureUI() {
        guard let pugViewModel = pugViewModel else {return}
        addSubview(vStack)
        vStack.addConstraintsToFillView(view: self)
        image.anchor(height: frame.width)
        image.anchor(left: self.leftAnchor, right: self.rightAnchor)
        heartButton.anchor(width: 50, height: 40)
        likesText.text = "Temp"
        self.setImage(image: pugViewModel.image)
        likesText.text = pugViewModel.likesAmount
    }
    
    // MARK: - Stack Views
    
    private lazy var innerStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [heartButton, likesText])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private func setImage(image: String){
        let url: URL = URL(string: image)!
        self.image.kf.setImage(with: url)
    }
    
    private lazy var vStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [image, innerStack])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10
        return stackView
    }()
}
