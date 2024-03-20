//
//  DateExtension.swift
//  App1
//
//  Created by Nikita Shipovskiy on 18/03/2024.
//

import UIKit

extension Date {
    func getDateDiference() -> String {
        let curentDateInterval = Int(Date().timeIntervalSinceReferenceDate)
        let dateDifferences = Double(curentDateInterval - Int(self.timeIntervalSinceReferenceDate))
        let dateDifferencesDate = Int(round(dateDifferences/86400))
        
        switch dateDifferencesDate {
        case 0:
            return "Today"
        case 1:
            return "Yesterday"
        case 2...4:
            return "\(dateDifferencesDate) day ago..."
        default:
            return "\(dateDifferencesDate) day's ago..."
        }
    }
    
    func formattDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en")
        formatter.dateFormat = "dd LLLL yyyy"
        
        return formatter.string(from: self)
    }
}
