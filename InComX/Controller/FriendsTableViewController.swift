//
//  FriendsTableViewController.swift
//  InComX
//
//  Created by Виктор Плесовских on 27.06.2022.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    @IBOutlet var SearchBar: UISearchBar!
    
    
    var friend = [
        Friends(name: "Олеся", image: UIImage(named: "image29"), gender: .Female),
        Friends(name: "Иван", image: UIImage(named: "krisjanisk"), gender: .Male),
        Friends(name: "Олег", image: UIImage(named: "mans"), gender: .Male),
        Friends(name: "Петр", image: UIImage(named: "image19"), gender: .Male),
        Friends(name: "Игорь", image: UIImage(named: "image9"), gender: .Male),
        Friends(name: "Павел", image: UIImage(named: "2h-media"), gender: .Male),
        Friends(name: "Дмитрий", image: UIImage(named: "image10"), gender: .Male),
        Friends(name: "Антон", image: UIImage(named: "image11"), gender: .Male),
        Friends(name: "Степан", image: UIImage(named: "image12"), gender: .Male),
        Friends(name: "Ирина", image: UIImage(named: "image13"), gender: .Female),
        Friends(name: "Ксения", image: UIImage(named: "image14"), gender: .Female),
        Friends(name: "Василий2", image: UIImage(named: "image15"), gender: .Male),
        Friends(name: "Кирилл", image: UIImage(named: "image1"), gender: .Male),
        Friends(name: "Виктор", image: UIImage(named: "image2"), gender: .Male),
        Friends(name: "Фёдор", image: UIImage(named: "image3"), gender: .Male),
        Friends(name: "Богдан", image: UIImage(named: "image4"), gender: .Male),
        Friends(name: "Константин", image: UIImage(named: "image5"), gender: .Male),
        Friends(name: "Адам", image: UIImage(named: "image6"), gender: .Male),
        Friends(name: "Леонид", image: UIImage(named: "image7"), gender: .Male),
        Friends(name: "Роман", image: UIImage(named: "image8"), gender: .Male),
        Friends(name: "Павел", image: UIImage(named: "image10"), gender: .Male),
        Friends(name: "Артемий", image: UIImage(named: "image11"), gender: .Male),
        Friends(name: "Петр", image: UIImage(named: "image12"), gender: .Male),
        Friends(name: "Алексей", image: UIImage(named: "image13"), gender: .Male),
        Friends(name: "Мирон", image: UIImage(named: "image14"), gender: .Male),
        Friends(name: "Владимир", image: UIImage(named: "image16"), gender: .Male),
    ]
    
    //Сортировка списка по начальной букве. Потом только нужно разбивать на секции. Иначе секции будут повторяться.
    var sortedFriends = [Character: [Friends]]()//Это словарь, который будет содержать букву и сортироваться
    //Поиск
    
    var searchName = [String]()
    var searching = false
//    var search = UISearchController()
//
//    var filterFriend = [Friends]()
//    func filterFriends(text:String){
//        filterFriend.removeAll()
//
//        filterFriend = friend.filter({(friend) -> Bool in
//            return friend.name.lowercased().contains(text.lowercased())
//        })
//    }
//    //проверка на "пустоту" поиска
//    func searchBarIsEmpty() -> Bool {
//        return search.searchBar.text?.isEmpty ?? true
//    }
//    //функция которая смотрит идет в данный момент поиск или нет
//    func inSearch() -> Bool {
//        return search.isActive && !searchBarIsEmpty()
//    }
    //добавление функции после фильтра и обновление таблицы друзей
//    func filterSearchFriends(text:String){
//       filterFriends(text: text)
//        tableView.reloadData()
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
        //search = UISearchController(searchResultsController: nil)
        //search.searchResultsUpdater = self
        //self.navigationItem.searchController = search
        //регистрация для таблицы шаблона ячейки для того чтобы ее можно было сипользовать в этом контроллере. Ячейку создал в XIB.
        tableView.register(UINib(nibName: "XibFriendsTableViewCell", bundle: nil), forCellReuseIdentifier: "FriendsXib")
        //После того, как создали ниже сортировку нам надо использовать этот метод. Его используем в didload то есть ниже
        self .sortedFriends = sort(friend: friend)// Это итог того, как отсортировали друзей.
    }
    
   //Создаем Метод, который будет сортировать
    private func sort(friend: [Friends]) -> [Character: [Friends]] {
        var friendDict = [Character: [Friends]]()//Это массив, который будем заполнять
        //Получаем первый символ
        friend.forEach() { friends in
            
            guard let firstChar = friends.name.first else{return}
            if var thisCharFriends = friendDict [firstChar] {
                thisCharFriends.append(friends)
                friendDict[firstChar] = thisCharFriends
            }else {friendDict[firstChar] = [friends]
                
            }
                
        }
        
        
        return friendDict
    }
   

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sortedFriends.keys.count
    }

    //Создание разделения по группам ячеек

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Количество строк в секции
        // #warning Incomplete implementation, return the number of rows
        let keySorted = sortedFriends.keys.sorted()
        let friends = sortedFriends[keySorted[section]]?.count ?? 0
        
       /* if inSearch(){
            return filterFriend.count
        }*/
        return friends
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsXib", for: indexPath) as? XibFriendsTableViewCell else {
            preconditionFailure("Error")
            
        }
        if searching {
            cell.FriendsVibLabel.text = searchName[indexPath.row]
        }else {
            cell.FriendsVibLabel?.text = friend[indexPath.row]
        }
        
//Создаем параметр который будет содержать нашу первую букву и обращаться к ней будем по секции
        let firstChar = sortedFriends.keys.sorted()[indexPath.section]
        let friends = sortedFriends[firstChar]!
        let friend: Friends = friends[indexPath.row]
       /*var friend:Friends
        if inSearch(){
            friend = filterFriend[indexPath.row]
        }else {
            friend = friends[indexPath.row]
        }*/
        //cell.ImageProfile 
        cell.FriendsVibLabel.text = friend.name
        cell.FriendsXibImage.image = friend.image
        
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
    // Ниже это добавление секций с первой буквой
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(sortedFriends.keys.sorted()[section])
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
}
//extension FriendsTableViewController: UISearchResultsUpdating {
//    func updateSearchResults(for search: UISearchController) {
//        filterSearchFriends(text: search.searchBar.text!)
//    }
//}
extension FriendsTableViewController:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchName = friend.filter({$0.prefix(searchText.count) == searchText})
        searching = true
        tableView.reloadData()
    }
}
