//
//  DetailsAddCommnetCell.swift
//  App1
//
//  Created by Nikita Shipovskiy on 22/03/2024.
//

import UIKit

class DetailsAddCommnetCell: UICollectionViewCell, CollectionViewCellProtocol {
    static var reuseId: String = "DetailsAddCommnetCell"
    
    var completion: ((String) -> ())?
    
    lazy var action = UIAction { [weak self] sender in
        let textField = sender.sender as! UITextField
        self?.completion?(textField.text ?? "")
        self?.endEditing(true)
    }
    
    lazy var textField: UITextField = {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = bounds.height/2
        $0.placeholder = "Add comments"
        $0.setLeftOffset()
        return $0
    }(UITextField(frame: bounds,primaryAction: action))
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(textField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

