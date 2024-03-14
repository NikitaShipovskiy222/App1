//
//  PasscodePresenter.swift
//  App1
//
//  Created by Nikita Shipovskiy on 14/03/2024.
//

import UIKit

protocol PasscodePresenterProtocol: AnyObject {
    var passcode: [Int] {get set}
    
    func enterPasscode(number: Int)
    func removeLastItemPasscode()
    func setNewPasscode()
    func checkPasscode()
    func clearPasscode(state: PasscodeState)
    
    init(view: PasscodeViewProtocol, passcodeState: PasscodeState)
}

class PasscodePresenter: PasscodePresenterProtocol{
    var passcode: [Int] = [] {
        didSet {
            
        }
    }
    var view: PasscodeViewProtocol
    var passcodeState: PasscodeState
    required init(view: PasscodeViewProtocol, passcodeState: PasscodeState) {
        self.view = view
        self.passcodeState = passcodeState
        
        view.passcodeState(state: .inputPasscode)
    }
    
    
    func enterPasscode(number: Int) {
        print(number)
    }
    
    func removeLastItemPasscode() {
        print(passcode)
    }
    
    func setNewPasscode() {
        
    }
    
    func checkPasscode() {
        
    }
    
    func clearPasscode(state: PasscodeState) {
        
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
