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
    Group(name: "Программирование", image: UIImage(named: "2hmedia")),
    Group(name: "Домашние питомцы", image: UIImage(named: "andrei")),
    
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
}
