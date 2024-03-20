//
//  DetailsView.swift
//  App1
//
//  Created by Nikita Shipovskiy on 20/03/2024.
//

import UIKit

protocol DetailsViewProtocol: AnyObject {
    
}

class DetailsView: UIViewController {
    var presenter: DetailsViewPresenterProtocol!
    private var menuViewHeigt = UIApplication.topSafeAreay + 50
    
    lazy var topMenuView: UIView = {
        $0.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: menuViewHeigt)
        $0.backgroundColor = .mainWhite
        return $0
    }(UIView())
    
    lazy var backAction = UIAction { [weak self] _ in
        self?.navigationController?.popViewController(animated: true)
        
    }
    
    lazy var menuAction = UIAction{ [weak self] _ in
        print("Menu")
        
    }
    
    lazy var navigationHeader: NavigationHeader = {
        NavigationHeader(backAction: backAction, menuAction: menuAction, date: presenter.item.date)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainWhite
        view.addSubview(topMenuView)
        setupPageHeader()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.isHidden = true
        
    }
    
    private func setupPageHeader() {
        let headerView = navigationHeader.getNavigationHeader(type: .back)
        headerView.frame.origin.y = UIApplication.topSafeAreay
        view.addSubview(headerView)
    }
}

extension DetailsView: DetailsViewProtocol {
    
}
