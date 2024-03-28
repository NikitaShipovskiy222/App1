//
//  AddPostTagCell.swift
//  App1
//
//  Created by Nikita Shipovskiy on 27/03/2024.
//

import UIKit

class AddPostTagCell: UICollectionViewCell, CollectionViewCellProtocol {
    static var reuseId: String = "AddPostTagCell"
    
    private lazy var tagView: UIView = {
        .configure(view: $0) { tagView in
            tagView.backgroundColor = UIColor(white: 1, alpha: 0.2)
            tagView.layer.cornerRadius = 14
            tagView.addSubview(self.tagStack)
        }
    }(UIView())
    
    private lazy var tagStack: UIStackView = {
        .configure(view: $0) { stack in
            stack.axis = .horizontal
            stack.spacing = 20
            stack.addArrangedSubview(self.tagLabel)
            stack.addArrangedSubview(self.removeButton)
        }
        
    }(UIStackView())
    
    private lazy var tagLabel: UILabel = {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    private lazy var removeButton: UIButton = {
        .configure(view: $0) { button in
            button.setBackgroundImage(.close, for: .normal)
            button.widthAnchor.constraint(equalToConstant: 15).isActive = true
            button.heightAnchor.constraint(equalToConstant: 15).isActive = true
        }
    }(UIButton(primaryAction: removeAction))
    
    private lazy var removeAction = UIAction { _ in
    print("remove")
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tagView)
        setConstraints()
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            tagView.topAnchor.constraint(equalTo: topAnchor),
            tagView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tagView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tagView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tagStack.topAnchor.constraint(equalTo: tagView.topAnchor, constant: 7),
            tagStack.bottomAnchor.constraint(equalTo: tagView.bottomAnchor, constant: -7),
            tagStack.leadingAnchor.constraint(equalTo: tagView.leadingAnchor, constant: 20),
            tagStack.trailingAnchor.constraint(equalTo: tagView.trailingAnchor, constant: -20),
            
        ])
    }
    
    func setTagText(tagText: String) {
        self.tagLabel.text = tagText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
