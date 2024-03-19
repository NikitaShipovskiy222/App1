//
//  ta.swift
//  App1
//
//  Created by Nikita Shipovskiy on 15/03/2024.
//

import UIKit


protocol TabBarViewPresenterProtocol: AnyObject {
    init(view: TabBarViewProtocol)
    func buildTabBar()
}
class TabBarViewPresenter {
    weak var view: TabBarViewProtocol?
    
    required init(view: TabBarViewProtocol) {
        self.view = view
        self.buildTabBar()
    }
    
    
    
    
}

extension TabBarViewPresenter: TabBarViewPresenterProtocol {
    
    func buildTabBar() {
        let mainSreen = Builder.createMainScreenController()
        
        let cameraSreen = Builder.createCameraScreenController()
     
        let favoriteSreen = Builder.createFavoritScreenController()

        self.view?.setControllers(controllers: [mainSreen, cameraSreen,favoriteSreen])
    }
}



