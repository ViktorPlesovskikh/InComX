//
//  FriendsTableViewController.swift
//  InComX
//
//  Created by Виктор Плесовских on 27.06.2022.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var friend = [
        Friends(name: "Олеся", image: UIImage(named: "image6")),
        Friends(name: "Иван", image: UIImage(named: "image6")),
        Friends(name: "Олег", image: UIImage(named: "image7")),
        Friends(name: "Петр", image: UIImage(named: "image8")),
        Friends(name: "Игорь", image: UIImage(named: "image9")),
        Friends(name: "Павел", image: UIImage(named: "Image_8")),
        Friends(name: "Дмитрий", image: UIImage(named: "image10")),
        Friends(name: "Антон", image: UIImage(named: "image11")),
        Friends(name: "Степан", image: UIImage(named: "image12")),
        Friends(name: "Ирина", image: UIImage(named: "image13")),
        Friends(name: "Кирилл", image: UIImage(named: "image14")),
        Friends(name: "Василий2", image: UIImage(named: "image15")),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friend.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCell", for: indexPath) as? FriendsTableViewCell else {
            preconditionFailure("Error")
        }

        //cell.ImageProfile 
        cell.NameFriends.text = friend[indexPath.row].name
        cell.imageFriends.image = friend[indexPath.row].image
        

        // Configure the cell...

        return cell
    }
    
       //добавление с помощью Segue(сеги) данных для отображения на следующем экране при нажатии на иконку профиля
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "IndividualShow", //проверка по какой СЕГЕ идет переход
           let destinationVC = segue.destination as? IndividualCollectionViewController,
           let indexPath = tableView.indexPathForSelectedRow {//ТО, на какую ячейку нажимаем. Создаем вручную!!!
           let profileName = friend[indexPath.row].name
           
               destinationVC.title = profileName //Надпись появляется в тапБаре на экране на который переходим
           }//проверка того КУДА/на какой экран мы переходим
       }
       
    @IBAction func addSelectFriends(segue: UIStoryboardSegue) {
        if let sourceVC = segue.source as? FriendsTableViewController, //контроль сеги откуда она приходит
        let indexPath = sourceVC.tableView.indexPathForSelectedRow {
            let friendes = sourceVC.friend[indexPath.row]
            if !friend.contains(where: { $0.name == friendes.name}) {
                friend.append(friendes)
                tableView.reloadData()
            }
    }
        
        
        
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            friend.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
