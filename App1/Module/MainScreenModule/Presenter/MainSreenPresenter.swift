//
//  MainSreenPresenter.swift
//  App1
//
//  Created by Nikita Shipovskiy on 15/03/2024.
//

import UIKit


protocol MainSreenPresenterProtocol: AnyObject {
    init(view: MainSreenViewProtocol)
}

class MainSreenPresenter{
    
    weak var view: MainSreenViewProtocol?
    
    required init(view: MainSreenViewProtocol) {
        self.view = view
        
    }
    
}

extension MainSreenPresenter: MainSreenPresenterProtocol{
    
}
