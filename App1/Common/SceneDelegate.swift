//
//  SceneDelegate.swift
//  App1
//
//  Created by Nikita Shipovskiy on 14/03/2024.
//

import UIKit

protocol SceneDelegateProtocol {
    func startMainSreen()
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var keychainManager = KeychainManager()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = Builder.createAddPostViewController(photos: [.img1,.img2,.img3])
       // Builder.createTabBarController() //Builder.getPasscodeController(passcodeState: checkIssetPasscode(), sceneDelegate: self)
        window?.makeKeyAndVisible()
    }
    
    private func checkIssetPasscode() -> PasscodeState {
        let keychainPasscodeResult = keychainManager.load(key: KeychainKeys.passcode.rawValue)
        switch keychainPasscodeResult {
            
        case .success(let code):
            return code.isEmpty ? .setNewPasscode : .inputPasscode
        case .failure:
            return .setNewPasscode
        }
    }



}


extension SceneDelegate: SceneDelegateProtocol {
    func startMainSreen() {
        
        self.window?.rootViewController = Builder.createTabBarController()
    }
}
