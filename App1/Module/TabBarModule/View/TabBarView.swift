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
    private let tabs: [UIImage] = [.home,.plus,.heart]
    
    private lazy var tabBarView: UIView = {
        return $0
    }(UIView(frame: CGRect(x: 0, y: view.frame.height - 100, width: view.frame.width, height: 70)))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(hideTabBar), name: .hideTabBar, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(goToMainView), name: .goToMain, object: nil)
        
        tabs.enumerated().forEach {
            let offset: [Double] = [-100,0,100]
            let tabButton = createTabBarButtun(icon: $0.element, tag: $0.offset , offsetX: offset[$0.offset], isBigButton: $0.offset == 1 ? true : false )
            
            tabBarView.addSubview(tabButton)
            
        }
        
        view.addSubview(tabBarView)
    }
    @objc func goToMainView() {
        self.selectedIndex = 0
    }
    
    @objc func hideTabBar(sender: Notification) {
        let isHide = sender.userInfo?["isHide"] as! Bool
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else { return }
            if isHide {
                self.tabBarView.frame.origin.y = self.view.frame.height
            } else {
                self.tabBarView.frame.origin.y = view.frame.height - 100
            }
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
            
            let buttonSize = isBigButton ? 60.0 : 30.0
            let yOffset = isBigButton ? 0 : 15
            
            $0.frame.size = CGSize(width: buttonSize, height: buttonSize)
            $0.tag = tag
            $0.setBackgroundImage(icon, for: .normal)
            $0.tintColor = .black
            $0.frame.origin = CGPoint(x: .zero, y: yOffset)
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
