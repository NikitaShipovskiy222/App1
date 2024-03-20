//
//  FavoritView.swift
//  App1
//
//  Created by Nikita Shipovskiy on 15/03/2024.
//

import UIKit


protocol FavoriteViewProtocol : AnyObject{
    func showPost()
}
class FavoriteView: UIViewController {
    
    
    var presenter: FavoriteViewPresenterProtocol!
    
    lazy var collectionView: UICollectionView = {
        
        let itemSize = ((view.bounds.width - 60) / 2) - 15
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumLineSpacing = 30
        //layout.minimumInteritemSpacing = 30
        layout.sectionInset = UIEdgeInsets(top: 50, left: 30, bottom: 80, right: 30)
        
        $0.showsVerticalScrollIndicator = false
        $0.dataSource = self
        $0.delegate = self
        
        $0.alwaysBounceVertical = true
        $0.backgroundColor = .mainWhite
        $0.register(FavoriteCell.self, forCellWithReuseIdentifier: FavoriteCell.resuseId)
        
        return $0
    }(UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainWhite
        view.addSubview(collectionView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavBar()
    }
    
    
    private func setupNavBar() {
        title = "Favorite"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .mainWhite
        
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
    }
}


extension FavoriteView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.post?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteCell.resuseId, for: indexPath) as! FavoriteCell
        
        if let item = presenter.post?[indexPath.item]{
            cell.configureCell(item: item)
        }
        
        return cell
    }
    
    
}


extension FavoriteView: UICollectionViewDelegate {
    
}

extension FavoriteView: FavoriteViewProtocol {
    func showPost(){
        
    }
}
