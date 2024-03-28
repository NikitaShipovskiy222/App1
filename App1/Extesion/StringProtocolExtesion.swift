//
//  StringProtocolExtesion.swift
//  App1
//
//  Created by Nikita Shipovskiy on 15/03/2024.
//

import UIKit


//MARK: - String -> [Int]
extension StringProtocol {
    var digits: [Int] { compactMap(\.wholeNumberValue) }
}
