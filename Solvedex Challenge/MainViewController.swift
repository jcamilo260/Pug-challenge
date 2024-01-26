//
//  ViewController.swift
//  Solvedex Challenge
//
//  Created by Juan Camilo Argüelles Ardila on 25/01/24.
//

import UIKit
import SwiftUI

class MainViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    var temp: [String] = ["TempImage", "TempImage", "TempImage", "TempImage"]
    private let mainVCViewModel: MainVCViewModel = MainVCViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Datasource.Menu.title
        self.configUI()
        self.setupCollectionView()
        self.subscriptions()
        self.mainVCViewModel.fetchPugs()
    }
    
    private func subscriptions(){
        self.mainVCViewModel.canReload.binder { _ in
            self.collectionView.reloadData()
        }
    }
    
    private func setupCollectionView(){
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(PugCollectionViewCell.self, forCellWithReuseIdentifier: Datasource.UICollection.cellIdentifier)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Datasource.UICollection.cellIdentifier, for: indexPath) as! PugCollectionViewCell
        cell.pugViewModel = self.mainVCViewModel.getPugViewModel(at: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.mainVCViewModel.getPugsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.width + Datasource.UICollection.extraHeightSize)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let screenHeight = scrollView.frame.size.height
        
        if offsetY > contentHeight - screenHeight{
            self.mainVCViewModel.fetchPugs()
        }
    }
}



struct ViewControllerPreview: PreviewProvider{
    static var previews: some View{
        VCPreview{
            MainViewController()
        }.ignoresSafeArea()
    }
    
    
}
