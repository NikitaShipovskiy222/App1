//
//  SettingsPresenter.swift
//  App1
//
//  Created by Nikita Shipovskiy on 28/03/2024.
//

import UIKit

protocol SettingsPresenterProtocol: AnyObject {
    init(view: SettingsViewProtocol)
}

class SettingsPresenter: SettingsPresenterProtocol {
    
    private weak var view: SettingsViewProtocol?
    
    required init(view: SettingsViewProtocol) {
        self.view = view
    }
    
    
    
}


