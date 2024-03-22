//
//  NavigationHeader.swift
//  App1
//
//  Created by Nikita Shipovskiy on 20/03/2024.
//

import UIKit


class NavigationHeader {
    
    var backAction: UIAction?
    var menuAction: UIAction?
    var closeAction: UIAction?
    var date: Date
    
    private lazy var naviagtionView: UIView = {
        $0.frame = CGRect(x: 30, y: 0, width: UIScreen.main.bounds.width - 60, height: 44)
        $0.backgroundColor = .mainWhite
        $0.addSubview(dateStack)
        
        return $0
    }(UIView())
    
    lazy var dateLabel: UILabel = getHeaderlabel(text: date.formattDate(formatType: .onlyDate), size: 30, weight: .bold)
    lazy var yearLabel: UILabel = getHeaderlabel(text: date.formattDate(formatType: .onlyYear) + "year"  , size: 14, weight: .light)
    
    lazy var backButton: UIButton = getActionButton(origin: CGPoint(x: 0, y: 9), icon: .backButton, action: backAction)
    
    lazy var closeButton: UIButton = getActionButton(origin: CGPoint(x:naviagtionView.frame.width - 30, y: 0), icon: .close, action: closeAction)
    
    lazy var menuButton: UIButton = getActionButton(origin: CGPoint(x:naviagtionView.frame.width - 30, y: 9), icon: .menu, action: menuAction)
    
    lazy var dateStack: UIStackView = {
        $0.axis = .vertical
        $0.addArrangedSubview(dateLabel)
        $0.addArrangedSubview(yearLabel)
        return $0
    }(UIStackView(frame: CGRect(x: 45, y: 0, width: 200, height: 44)))
    
    init(backAction: UIAction? = nil, menuAction: UIAction? = nil, closeAction: UIAction? = nil, date: Date) {
        self.backAction = backAction
        self.menuAction = menuAction
        self.closeAction = closeAction
        self.date = date
    }
    
    func getNavigationHeader(type: NavigationHeaderType) -> UIView {
        switch type {
        case .back:
            naviagtionView.addSubview(backButton)
            naviagtionView.addSubview(menuButton)
        case .close:
            naviagtionView.addSubview(closeButton)
        }
        return naviagtionView
    }
    
    private func getActionButton(origin: CGPoint, icon: UIImage, action: UIAction?) -> UIButton {
        let button = UIButton(primaryAction: action)
        button.frame.size = CGSize(width: 25, height: 25)
        button.frame.origin = origin
        button.setBackgroundImage(icon, for: .normal)
        return button
    }
    
    private func getHeaderlabel(text: String, size: CGFloat, weight: UIFont.Weight) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        
        return label
    }
    
}

enum NavigationHeaderType {
    case back, close
}
