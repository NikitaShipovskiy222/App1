//
//  UITextFiled.ext.swift
//  App1
//
//  Created by Nikita Shipovskiy on 22/03/2024.
//

import UIKit

extension UITextField {
    func setLeftOffset() {
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 10))
        self.leftViewMode = .always
    }
}
