//
//  AppPostView.swift
//  App1
//
//  Created by Nikita Shipovskiy on 26/03/2024.
//

import UIKit

protocol AddPostViewProtocol: AnyObject {
    
}

class AddPostView: UIViewController, AddPostViewProtocol {

    var presenter: AddPostPresenter!
    
    private var menuViewHeigt = UIApplication.topSafeAreay + 50
    
    lazy var topMenuView: UIView = {
        $0.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: menuViewHeigt)
        $0.backgroundColor = .mainWhite
        return $0
    }(UIView())
    

    
    lazy var navigationHeader: NavigationHeader = {
        NavigationHeader(backAction: self.backAction, date: Date())
    }()
    
    lazy var backAction = UIAction { [weak self] _ in
    print("Back")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainWhite
        setupHeader()

    }
    
    private func setupHeader() {
        let header = navigationHeader.getNavigationHeader(type: .addPostView)
        header.frame.origin.y = UIApplication.topSafeAreay
        view.addSubview(header)
    }

}
