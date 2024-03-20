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

    var presenter: TabBarViewPresenterProtocol!
    private let tabs: [UIImage] = [.home,.plus,.liked]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabs.enumerated().forEach {
            let offset: [Double] = [-100,0,100]
            let tabButton = createTabBarButtun(icon: $0.element, tag: $0.offset , offsetX: offset[$0.offset], isBigButton: $0.offset == 1 ? true : false )
            
            view.addSubview(tabButton)
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        selectedIndex = 2
    }
    
    lazy var selecteItem = UIAction{ [weak self] sender in
        guard
            let self = self,
            let sender = sender.sender as? UIButton
        else {return}
        
        self.selectedIndex = sender.tag
    }


    override func viewWillAppear(_ animated: Bool) {
        self.tabBar.isHidden = true
    }
}

extension TabBarView {
    
    private func createTabBarButtun(icon: UIImage, tag: Int, offsetX: Double,isBigButton: Bool = false) -> UIButton{
        
        return {
            
            let buttonSize = isBigButton ? 70.0 : 20.0
            $0.frame.size = CGSize(width: buttonSize, height: buttonSize)
            $0.tag = tag
            $0.setBackgroundImage(icon, for: .normal)
            $0.tintColor = .black
            $0.frame.origin = CGPoint(x: .zero, y: view.frame.height - (buttonSize + (isBigButton ? 44 : 62 )))
            $0.center.x = view.center.x + offsetX
            return $0
            
        }(UIButton(primaryAction: selecteItem))
    }
}
    

extension TabBarView: TabBarViewProtocol{
    func setControllers(controllers: [UIViewController]) {
        setViewControllers(controllers, animated: true)
    }
    
    
}
