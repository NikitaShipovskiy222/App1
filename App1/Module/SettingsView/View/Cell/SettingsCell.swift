//
//  TableViewCell.swift
//  App1
//
//  Created by Nikita Shipovskiy on 28/03/2024.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    static let resueId = "SettingsCell"
    var completion: ( () -> () )?
    
    
    lazy var cellView: UIView = {
        .configure(view: $0) { view in
            view.backgroundColor = .mainWhite
            view.layer.cornerRadius = 30
            view.clipsToBounds = true
        }
    }(UIView())
    
    lazy var cellStack: UIStackView = {
        .configure(view: $0) { stack in
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .equalSpacing
        }
    }(UIStackView())
    
    lazy var nextButton: UIButton = {
        .configure(view: $0) { btn in
            btn.widthAnchor.constraint(equalToConstant: 18).isActive = true
            btn.heightAnchor.constraint(equalToConstant: 25).isActive = true
            btn.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            btn.tintColor = .gray
        }
    }(UIButton(primaryAction: nextButtonAction))
    
    lazy var cellLabel: UILabel = {
        .configure(view: $0) { label in
            label.textColor = .black
        }
    }(UILabel())
    
    
    private lazy var locationSwitch: UISwitch = {
        $0.onTintColor = .white
        return $0
    }(UISwitch())
    
    private lazy var nextButtonAction = UIAction { [weak self] _ in
        self?.completion?()
        
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
