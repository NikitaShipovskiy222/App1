//
//  TabBarViewController.swift
//  App1
//
//  Created by Nikita Shipovskiy on 15/03/2024.
//

import UIKit


protocol TabBarViewProtocol: AnyObject {
    func setControllers(controllers: [UIViewController])
}

class TabBarView: UITabBarController {

    var presenter: TabBarViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .mainWhite
    }


}

extension TabBarView: TabBarViewProtocol{
    func setControllers(controllers: [UIViewController]) {
        tabBarController?.setViewControllers(controllers, animated: true)
    }
    
    
}
