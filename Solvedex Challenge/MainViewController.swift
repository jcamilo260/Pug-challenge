//
//  ViewController.swift
//  Solvedex Challenge
//
//  Created by Juan Camilo Argüelles Ardila on 25/01/24.
//

import UIKit
import SwiftUI

class MainViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var temp: [String] = ["TempImage", "TempImage", "TempImage", "TempImage"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pugs"
        self.configUI()
        self.setupCollectionView()
    }
    
    private func setupCollectionView(){
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(PugCollectionViewCell.self, forCellWithReuseIdentifier: "\(PugCollectionViewCell.self)")
    }
    
    private func configUI(){
        let layout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.view.addSubview(self.collectionView!)
        self.collectionView.addConstraintsToFillView(view: self.view)
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PugCollectionViewCell.self)", for: indexPath) as! PugCollectionViewCell
        cell.image.image = UIImage(named: self.temp[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.temp.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.width + 80)
    }
}



struct ViewControllerPreview: PreviewProvider{
    static var previews: some View{
        VCPreview{
            MainViewController()
        }.ignoresSafeArea()
    }
    
    
}
