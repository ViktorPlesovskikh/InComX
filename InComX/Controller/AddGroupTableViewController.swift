//
//  AddGroupTableViewController.swift
//  InComX
//
//  Created by Виктор Плесовских on 28.06.2022.
//

import UIKit

class AddGroupTableViewController: UITableViewController {
var addGrups = [
Group(name: "Delivery Foot", image: UIImage(named: "image13")),
Group(name: "Auto Sakhalin", image: UIImage(named: "image8"))

]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Group"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return addGrups.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddGroupTableViewCell", for: indexPath) as?  AddGroupTableViewCell else {
            preconditionFailure("Error")
             
        }
        
        // Configure the cell...
        cell.addGroupName.text = addGrups[indexPath.row].name
        cell.addGroupImage.image = addGrups[indexPath.row].image
        
        return cell
    }
}
 
