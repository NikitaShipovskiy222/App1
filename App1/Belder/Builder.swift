//
//  Bilder.swift
//  App1
//
//  Created by Nikita Shipovskiy on 14/03/2024.
//

import UIKit

protocol BulderProtocol {
    static func gerPasscodeController() -> UIViewController
    
}

class Builder: BulderProtocol {
    static func gerPasscodeController() -> UIViewController {
        let passcodeView = PasscodeView()
        let presenter = PasscodePresenter(view: passcodeView, passcodeState: .inputPasscode)
        
        passcodeView.passcodePresenter = presenter
        return passcodeView
    }
}
