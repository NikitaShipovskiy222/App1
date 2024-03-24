//
//  CameraView.swift
//  App1
//
//  Created by Nikita Shipovskiy on 15/03/2024.
//

import UIKit

protocol CameraViewProtocol: AnyObject {
    
}

class CameraView: UIViewController, CameraViewProtocol {

    var presenter: CameraViewPresenterProtocol!
    
    lazy var shotsCollectioView: UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 60, height: 60)
        
        $0.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "shotCell")
        $0.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .clear
        $0.dataSource = self
        return $0
    }(UICollectionView(frame: CGRect(x: 0, y: 60, width: view.frame.width - 110, height: 60), collectionViewLayout: UICollectionViewFlowLayout()))
    
    private lazy var closeButton: UIButton = {
        $0.setBackgroundImage(.close, for: .normal)
        return $0
    }(UIButton(frame: CGRect(x: view.frame.width - 60, y: 60, width: 25, height: 25), primaryAction: presenter.closeViewAction))
    
    private lazy var shotButton: UIButton = {
        $0.setBackgroundImage(.cameraButton, for: .normal)
        return $0
    }(UIButton(frame: CGRect(x: view.center.x - 30 , y: view.frame.height - 110, width: 60, height: 60), primaryAction: shotAction))
    
    private lazy var shotAction = UIAction { _ in
        print(#function)
    }
    
    private lazy var switchCamera: UIButton = {
        $0.setBackgroundImage(.switchButton, for: .normal)
        return $0
    }(UIButton(frame: CGRect(x: shotButton.frame.origin.x - 70, y: shotButton.frame.origin.y + 16, width: 35, height: 35), primaryAction: presenter.switchCamera))
    
    private lazy var nextButton: UIButton = {
        $0.setTitle("Go", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 17.5
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.frame.size = CGSize(width: 100, height: 35)
        $0.frame.origin = CGPoint(x: shotButton.frame.origin.x + 90, y: shotButton.frame.origin.y + 12.5 )
        return $0
    }(UIButton())
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        NotificationCenter.default.post(name: .hideTabBar, object: nil, userInfo: ["isHide": true])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.addSubview(shotsCollectioView)
        view.addSubview(closeButton)
        view.addSubview(shotButton)
        view.addSubview(switchCamera)
        view.addSubview(nextButton)
    }
}

extension CameraView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shotCell", for: indexPath)
        
        cell.backgroundColor = .green
        return cell
    }
    
    
}
