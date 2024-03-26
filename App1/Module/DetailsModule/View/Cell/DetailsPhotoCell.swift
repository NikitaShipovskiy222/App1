//
//  DetailsPhotoCell.swift
//  App1
//
//  Created by Nikita Shipovskiy on 22/03/2024.
//

import UIKit

class DetailsPhotoCell: UICollectionViewCell, CollectionViewCellProtocol {
    static var reuseId: String = "DetailsPhotoCell"
    
    lazy var cellImage: UIImageView = {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        return $0
    }(UIImageView(frame: bounds))
    lazy var imageMenuButton: UIButton = {
        $0.setBackgroundImage(.points, for: .normal)
        $0.frame = CGRect(x: cellImage.frame.width - 50, y: 30, width: 31, height: 31)
        return $0
    }(UIButton())
    
    required override init(frame: CGRect){
        super.init(frame: frame)
        layer.cornerRadius = 30
        clipsToBounds = true
        addSubview(cellImage)
        cellImage.addSubview(imageMenuButton)
    }
    
    func configureCell(image: String) {
        cellImage.image = UIImage(named: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
