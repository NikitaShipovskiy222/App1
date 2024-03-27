//
//  AddPostPresenter.swift
//  App1
//
//  Created by Nikita Shipovskiy on 26/03/2024.
//

import UIKit

protocol AddPostPresenterProtocol: AnyObject {
    init(view: AddPostViewProtocol, photos: [UIImage])
    var photos: [UIImage] {get set}
    var tags: [String] {get set}
}

class AddPostPresenter: AddPostPresenterProtocol {
  
    private weak var view: AddPostViewProtocol?
    
    var photos: [UIImage]
    var tags: [String] = ["HEELLLLOOO","LMAO","GANG"]

    
    
    required init(view: AddPostViewProtocol, photos: [UIImage]) {
        self.photos = photos
        self.view = view
        
    }
}
