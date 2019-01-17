//
//  ViewController.swift
//  Labwork 56
//
//  Created by Алихан Пешхоев on 16/12/2018.
//  Copyright © 2018 Алихан Пешхоев. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var storage = DataStorage()
    var categoriesArray:[[String:Any]]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.categoriesArray = self.storage.getCategories()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let title = self.categoriesArray![indexPath.row]["title"] as! String
        cell.textLabel?.text = title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let parameters = DetailsViewParameters()
        parameters.title = self.categoriesArray![indexPath.row]["title"] as! String
        parameters.items = storage.getListForCategory(category: indexPath.row + 1)
        
        let viewController = DetailsViewController()
        viewController.parameters = parameters
        
        self.present(viewController, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

