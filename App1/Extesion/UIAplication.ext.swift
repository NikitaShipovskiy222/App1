//
//  UIAplication.swift
//  App1
//
//  Created by Nikita Shipovskiy on 18/03/2024.
//

import UIKit

extension UIApplication {
    static var topSafeAreay: CGFloat  {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
       return scene?.windows.first?.safeAreaInsets.top ?? .zero
    }
}
