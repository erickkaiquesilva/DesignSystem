//
//  ViewController.swift
//  DesignSystem
//
//  Created by Erick Kaique Da Silva on 06/02/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

class DesignSystemViewController: UITableViewController {

    let dataSource: DesginSystemDataSource
    let cellID = "DesignSystemCell"
    
    init() {
        self.dataSource = DesginSystemDataSource()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false
        
    }

}

extension DesignSystemViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.sections[section].components.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let title = dataSource.sections[indexPath.section].components[indexPath.row].name
        cell.textLabel?.text = title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSource.sections[section].name
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 37
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let component = dataSource.sections[indexPath.section].components[indexPath.row]
        guard let viewController = component as? UIViewController else { return }
        viewController.title = component.name
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as? UITableViewHeaderFooterView
        if let header = header {
            header.textLabel?.textColor = .black
            header.tintColor = .orange
            header.alpha = 1.0
        }
    }
}
