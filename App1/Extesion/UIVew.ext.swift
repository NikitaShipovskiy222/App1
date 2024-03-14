//
//  UIVew.swift
//  App1
//
//  Created by Nikita Shipovskiy on 14/03/2024.
//

import UIKit

extension UIView {
   static func configure<T: UIView>(view: T, block: @escaping (T) -> ()) -> T{
       view.translatesAutoresizingMaskIntoConstraints = false
       block(view)
       return view
    }
}
