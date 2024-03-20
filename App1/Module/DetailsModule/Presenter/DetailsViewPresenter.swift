//
//  DetailsViewPresenter.swift
//  App1
//
//  Created by Nikita Shipovskiy on 20/03/2024.
//

import UIKit

protocol DetailsViewPresenterProtocol {
    init(view: DetailsViewProtocol, item: PostItem )
    var item: PostItem { get }
}

class DetailsViewPresenter: DetailsViewPresenterProtocol{
    private weak var view: DetailsViewProtocol?
    var item: PostItem
    required init(view: DetailsViewProtocol, item: PostItem) {
        self.view = view
        self.item = item
    }
    

    
}
