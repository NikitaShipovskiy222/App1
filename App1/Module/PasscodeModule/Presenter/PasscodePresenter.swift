//
//  PasscodePresenter.swift
//  App1
//
//  Created by Nikita Shipovskiy on 14/03/2024.
//

import UIKit

protocol PasscodePresenterProtocol: AnyObject {
    var passcode: [Int] {get set}
    var templatePasscode: [Int]? {get set}
    func enterPasscode(number: Int)
    func removeLastItemPasscode()
    func setNewPasscode()
    func checkPasscode()
    func clearPasscode(state: PasscodeState)
    
    init(view: PasscodeViewProtocol, passcodeState: PasscodeState, keychainManager: KeychainManagerProtocol, sceneDelegate: SceneDelegateProtocol)
}

class PasscodePresenter: PasscodePresenterProtocol{
    var templatePasscode: [Int]?
    var passcode: [Int] = [] {
        didSet {
            if passcode.count == 4 {
                switch passcodeState {
                case .inputPasscode:
                    self.checkPasscode()
                case .setNewPasscode:
                    self.setNewPasscode()
                default:
                    break
                }
            }
        }
    }
    
    weak var view: PasscodeViewProtocol?
    
    var passcodeState: PasscodeState
    var keychainManager: KeychainManagerProtocol
    var sceneDelegate: SceneDelegateProtocol
    
    required init(view: PasscodeViewProtocol, passcodeState: PasscodeState, keychainManager: KeychainManagerProtocol, sceneDelegate: SceneDelegateProtocol) {
        self.view = view
        self.passcodeState = passcodeState
        self.keychainManager = keychainManager
        self.sceneDelegate = sceneDelegate
        
        view.passcodeState(state: passcodeState)
    }
    
    
    func enterPasscode(number: Int) {
        if passcode.count < 4 {
            self.passcode.append(number)
            view?.enterCode(code: passcode)
        }
    }
    
    func removeLastItemPasscode() {
        if !passcode.isEmpty{
            self.passcode.removeLast()
            view?.enterCode(code: passcode)
        }
    }
    
    func setNewPasscode() {
        
        if templatePasscode != nil {
            if passcode == templatePasscode! {
                //  1,2,3,4 -> "1234"
                let stringPasscode = passcode.map{String($0)}.joined()
                
                keychainManager.save(key: KeychainKeys.passcode.rawValue, value: stringPasscode)
                self.sceneDelegate.startMainSreen()
                // ->
            } else {
                self.view?.passcodeState(state: .codeMissmatch)
            }
        } else {
            templatePasscode = passcode
            self.clearPasscode(state: .repeatPasscode)
        }
        
    }
    
    func checkPasscode() {
        let keychainPasscodeResult = keychainManager.load(key: KeychainKeys.passcode.rawValue)
        switch keychainPasscodeResult {
            
        case .success(let code):
            //String -> [Int]
            if self.passcode == code.digits {
                self.sceneDelegate.startMainSreen()
            } else {
                self.clearPasscode(state: .wrongPasscode)
            }
            
        case .failure(let err):
            print(err.localizedDescription)
        }
        
    }
    
    func clearPasscode(state: PasscodeState) {
        self.passcode = []
        self.view?.enterCode(code: [])
        view?.passcodeState(state: state)
    }
    

    
    
}

enum PasscodeState: String {
    case inputPasscode, wrongPasscode, setNewPasscode, repeatPasscode, codeMissmatch
    
    func getPasscodeLabel() -> String {
        switch self {
        case .inputPasscode:
            return "Вводите пароль"
        case .wrongPasscode:
            return "Неверный пароль"
        case .setNewPasscode:
            return "Установить пароль"
        case .repeatPasscode:
            return "Повторите пароль"
        case .codeMissmatch:
            return "Пароль не свопадает"
        }
    }
}
