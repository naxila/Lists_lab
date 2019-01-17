//
//  DetailsViewController.swift
//  Labwork 56
//
//  Created by Алихан Пешхоев on 10/01/2019.
//  Copyright © 2019 Алихан Пешхоев. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var parameters:DetailsViewParameters?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = parameters?.title!
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (parameters!.items!["list"] as! [[String:Any]]).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: CategoriesTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "DetailsCell") as? CategoriesTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: "CategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailsCell")
            cell = tableView.dequeueReusableCell(withIdentifier: "DetailsCell") as? CategoriesTableViewCell
        }
    
        let item = parameters!.items!["list"] as! [[String:Any]]
        
        cell.titleLabel?.text = (item[indexPath.row]["title"] as! String)
        cell.itemImageView?.image = UIImage.init(named: item[indexPath.row]["image"] as! String)
        cell.descriptionTextView?.text = (item[indexPath.row]["description"] as! String)
        cell.adressLabel?.text = (item[indexPath.row]["adress"] as! String)
        cell.phoneLabel?.text = (item[indexPath.row]["contacts"] as! String)
        
//        let cell = UITableViewCell()
        
//
//        cell.textLabel?.text = item[indexPath.row]["title"] as! String
        return cell
    }
    
}
