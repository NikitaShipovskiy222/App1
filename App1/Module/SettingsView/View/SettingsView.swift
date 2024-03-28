//
//  SettingsView.swift
//  App1
//
//  Created by Nikita Shipovskiy on 28/03/2024.
//

import UIKit

protocol SettingsViewProtocol: AnyObject {
    var tableView: UITableView {get set}
}

class SettingsView: UIViewController, SettingsViewProtocol {
    
    
    lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.backgroundColor = .lightGray
        $0.separatorStyle = .none
        return $0
    }(UITableView(frame: view.bounds, style: .insetGrouped))
    
    
    var presenter: SettingsPresenter!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = .lightGray
        navigationController?.navigationBar.barTintColor = .mainWhite
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
        ]
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        title = "Settings"

        view.backgroundColor = .white
            
    }
}

extension SettingsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SettingsItems.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    
}
