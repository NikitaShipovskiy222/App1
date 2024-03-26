//
//  PasscodeView.swift
//  App1
//
//  Created by Nikita Shipovskiy on 14/03/2024.
//

import UIKit

protocol PasscodeViewProtocol: AnyObject {
    func passcodeState(state: PasscodeState)
    func enterCode(code: [Int])
}

class PasscodeView: UIViewController {

    private let buttons: [[Int]] = [[1,2,3],[4,5,6], [7,8,9],[0]]
    var passcodePresenter: PasscodePresenterProtocol!
    
    private lazy var passcodeTitle: UILabel = {
        .configure(view: $0) { lable in
            lable.textColor = .black
            lable.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            lable.textAlignment = .center
        }
    }(UILabel())
    
    private lazy var keyboardStack: UIStackView = {
        .configure(view: $0) { stack in
            stack.axis = .vertical
            stack.distribution = .equalSpacing
            stack.alignment = .center
            
        }
    }(UIStackView())
    
    private lazy var codeStack: UIStackView = {
        .configure(view: $0) { stack in
            stack.axis = .horizontal
            stack.distribution = .equalCentering
            stack.spacing = 20
        }
    }(UIStackView())
    
    private lazy var deleteBtn: UIButton = {
        .configure(view: $0) { button in
            button.widthAnchor.constraint(equalToConstant: 40).isActive = true
            button.heightAnchor.constraint(equalToConstant: 30).isActive = true
            button.setBackgroundImage(.dele, for: .normal)
            
            
        }
    }(UIButton(primaryAction: deleteCodeAction))

    private lazy var enterCodeAction = UIAction { [weak self] sender in
        guard
            let self = self,
            let sender = sender.sender as? UIButton
        else {return}
        
        self.passcodePresenter.enterPasscode(number: sender.tag)
    }
    private lazy var deleteCodeAction = UIAction { [weak self]sender in
        guard
            let self = self,
            let sender = sender.sender as? UIButton
        else {return}
        
        self.passcodePresenter.removeLastItemPasscode()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainWhite
        
        [keyboardStack, passcodeTitle, codeStack, deleteBtn].forEach {
            view.addSubview($0)
            
        }
        buttons.forEach{
            let buttonLite = setHorizontalNumStatck(range: $0)
            keyboardStack.addArrangedSubview(buttonLite)
        }
        
        (11...14).forEach{
            let view = getCodeView(tag: $0)
            codeStack.addArrangedSubview(view)
            
        }
        
        
        NSLayoutConstraint.activate([
            
            passcodeTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passcodeTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passcodeTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            
            codeStack.topAnchor.constraint(equalTo: passcodeTitle.bottomAnchor, constant: 50),
            codeStack.widthAnchor.constraint(equalToConstant: 140),
            codeStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            
            keyboardStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            keyboardStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            keyboardStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            keyboardStack.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 80),
            
            
            deleteBtn.rightAnchor.constraint(equalTo: keyboardStack.rightAnchor,constant: -20),
            deleteBtn.bottomAnchor.constraint(equalTo: keyboardStack.bottomAnchor, constant: -25)
            
            
        ])
        
    }
}

extension PasscodeView {
    private func getHorizontalNumStatck() -> UIStackView {
        return {
            .configure(view: $0) { stack in
                stack.axis = .horizontal
                stack.spacing = 50
            }
        }(UIStackView())
    }
    private func setHorizontalNumStatck(range: [Int]) -> UIStackView {
        let stack = getHorizontalNumStatck()
        range.forEach {
            let numButton = UIButton(primaryAction: enterCodeAction)
            numButton.tag = $0
            numButton.setTitle("\($0)", for: .normal)
            numButton.setTitleColor(.mainBlack, for: .normal)
            numButton.titleLabel?.font = UIFont.systemFont(ofSize: 60, weight: .light)
            numButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
            stack.addArrangedSubview(numButton)
        }
        
        return stack
    }
    
    private func getCodeView(tag: Int) -> UIView {
        return {
            $0.widthAnchor.constraint(equalToConstant: 20).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 20).isActive = true
            $0.layer.cornerRadius = 10
            $0.layer.borderWidth = 2
            $0.tag = tag
            
            $0.layer.borderColor = UIColor.black.cgColor
            return $0
        }(UIView())
    }
    
}


extension PasscodeView: PasscodeViewProtocol {
   
    func passcodeState(state: PasscodeState) {
        passcodeTitle.text = state.getPasscodeLabel()
    }
    
    func enterCode(code: [Int]) {
        let tag = code.count + 10
        
        (tag...14).forEach {
            view.viewWithTag($0)?.backgroundColor = .none
        }
        
        view.viewWithTag(tag)?.backgroundColor = .black
    }
    
    
}
