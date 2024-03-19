//
//  FavoriteCell.swift
//  App1
//
//  Created by Nikita Shipovskiy on 19/03/2024.
//

import UIKit

class FavoriteCell: UICollectionViewCell {
    static let resuseId = "FavoriteCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
