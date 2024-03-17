//
//  MainPostHeader.swift
//  App1
//
//  Created by Nikita Shipovskiy on 17/03/2024.
//

import UIKit

class MainPostHeader: UICollectionReusableView {
        
    
    static let reuseId = "MainPostHeader"
    
    lazy var headerLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .white
        
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
