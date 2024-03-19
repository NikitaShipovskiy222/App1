//
//  Bilder.swift
//  App1
//
//  Created by Nikita Shipovskiy on 14/03/2024.
//

import UIKit

protocol BuilderProtocol {
    static func getPasscodeController(passcodeState: PasscodeState, sceneDelegate: SceneDelegateProtocol) -> UIViewController
    static func createTabBarController() -> UIViewController
    
    //MARK: - VC
    
    static func createMainScreenController() -> UIViewController
    static func createCameraScreenController() -> UIViewController
    static func createFavoritScreenController() -> UIViewController
}

class Builder: BuilderProtocol {
    
    static func createTabBarController() -> UIViewController {
        let tabBarView = TabBarView()
        let presenter = TabBarViewPresenter(view: tabBarView)
        tabBarView.presenter = presenter
        
        return tabBarView
    }
    

    static func getPasscodeController(passcodeState: PasscodeState, sceneDelegate: SceneDelegateProtocol) -> UIViewController {
        let passcodeView = PasscodeView()
        let keychainManager = KeychainManager()
        
        
        let presenter = PasscodePresenter(view: passcodeView, passcodeState: passcodeState, keychainManager: keychainManager, sceneDelegate: sceneDelegate)
        
        passcodeView.passcodePresenter = presenter
        return passcodeView
    }
    static func createTabBarController(sceneDelegate: SceneDelegateProtocol) -> UIViewController {
        let tabBarView = TabBarView()
        let presenter = TabBarViewPresenter(view: tabBarView)
        tabBarView.presenter = presenter
        
        return tabBarView
    }
    
    static func createMainScreenController() -> UIViewController {
        let mainView = MainSreenView()
        let presenter = MainSreenPresenter(view: mainView)
        mainView.presenter = presenter
        
        return mainView
    }
    
    static func createCameraScreenController() -> UIViewController {
        let cameraView = CameraView()
        
        return cameraView
    }
    
    static func createFavoritScreenController() -> UIViewController {
        let favoritView = FavoriteView ()
        let presenter =  FavoriteViewPresenter(view: favoritView)
        
        favoritView.presenter = presenter
        return UINavigationController(rootViewController: favoritView)
    }
}
