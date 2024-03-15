//
//  MainSreenView.swift
//  App1
//
//  Created by Nikita Shipovskiy on 15/03/2024.
//

import UIKit


protocol MainSreenViewProtocol: AnyObject {
    func showPosts()
}

class MainSreenView: UIViewController {

    var presenter: MainSreenPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}

extension MainSreenView: MainSreenViewProtocol{
    func showPosts() {
        //
    }
    
    
}
