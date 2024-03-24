//
//  FavoriteViewPresenter.swift
//  App1
//
//  Created by Nikita Shipovskiy on 19/03/2024.
//

import UIKit

protocol FavoriteViewPresenterProtocol: AnyObject{
    init(view: FavoriteViewProtocol)
    var post: [PostItem]? {get set}
    func getPosts()
    
}

class FavoriteViewPresenter: FavoriteViewPresenterProtocol {
    var post: [PostItem]?
    private weak var view: FavoriteViewProtocol?
    
    required init(view: FavoriteViewProtocol) {
        self.view = view
        getPosts()
    }
    func getPosts() {
        
        self.post = PostItem.getMockItem()
        self.view?.showPost()
    
    }
    
}
