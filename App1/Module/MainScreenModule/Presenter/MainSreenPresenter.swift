//
//  MainSreenPresenter.swift
//  App1
//
//  Created by Nikita Shipovskiy on 15/03/2024.
//

import UIKit


protocol MainSreenPresenterProtocol: AnyObject {
    init(view: MainSreenViewProtocol)
    var posts: [PostDate]? { get set }
    func getPosts()
}

class MainSreenPresenter{
    
    weak var view: MainSreenViewProtocol?
    var posts: [PostDate]?
    
    required init(view: MainSreenViewProtocol) {
        self.view = view
        getPosts()
        
    }
    
}

extension MainSreenPresenter: MainSreenPresenterProtocol{
    func getPosts() {
        self.posts = PostDate.getMockDate()
        
        view?.showPosts()
    }
    
}
