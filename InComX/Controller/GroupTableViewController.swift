//
//  GroupTableViewController.swift
//  InComX
//
//  Created by Виктор Плесовских on 26.06.2022.
//

import UIKit

class GroupTableViewController: UITableViewController {

    var group = [
    Group(name: "Автопром", image: UIImage(named: "image15")),
    Group(name: "Доставка еды", image: UIImage(named: "image16")),
    Group(name: "Теплые полы", image: UIImage(named: "image17")),
    Group(name: "Плитка он-лайн", image: UIImage(named: "image18")),
    Group(name: "Скульпторы людей", image: UIImage(named: "image19")),
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
        return group.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell", for: indexPath) as? GroupTableViewCell else {
            preconditionFailure("Error")
        }

        //cell.ImageProfile
        cell.NameGroupTableGroupCell.text = group[indexPath.row].name
        cell.ImageGroupTableViewCell.image = group[indexPath.row].image
        return cell
        }

    //Добавление данных с ячейки другого экрана на этот с обновлением таблицы:
 @IBAction func addSelectGroup(segue: UIStoryboardSegue) {
        if let sourceVC = segue.source as? AddGroupTableViewController,//обращение к контроллеру, где происходит нажатие на ячейку
        //Ниже строчка: тут мы обращаемся к ячейке таблицы на экране и "{" и пишем дальше код подтягивания данных.
            let indexPath = sourceVC.tableView.indexPathForSelectedRow{
       
            let grupp = sourceVC.addGrups[indexPath.row]//Подтягивание данных с того массива, с которого добавляем
            group.append(grupp)// Запись в массив на этом экране
            tableView.reloadData()
        }
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    //Удаление группы с обновлением данных таблицы
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            group.remove(at: indexPath.row)
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
    */}
