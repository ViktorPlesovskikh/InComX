//
//  ProfileFriendsViewController.swift
//  InComX
//
//  Created by Виктор Плесовских on 27.06.2022.
//

import UIKit

class ProfileFriendsViewController: UIViewController {
    
    var filtredProfile = [Friends]()
    
    @IBOutlet var SearchBar: UISearchBar! {
        didSet {
            SearchBar.delegate = self
        }
    }
   //переход на этот экран без сеги
    
    
var friend = [
//        Friends(name: "Олеся", image: UIImage(named: "image6"), gender: .Female),
//        Friends(name: "Иван", image: UIImage(named: "image2"), gender: .Male),
//        Friends(name: "Олег", image: UIImage(named: "image3"), gender: .Male),
//        Friends(name: "Петр", image: UIImage(named: "image4"), gender: .Male),
//        Friends(name: "Игорь", image: UIImage(named: "image5"), gender: .Male),
//        Friends(name: "Павел", image: UIImage(named: "image6"), gender: .Male),
//        
   ]
//    
    @IBOutlet var TableView: UITableView! {
        didSet {
            TableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.register(UINib(nibName: "XibFriendsTableViewCell", bundle: nil), forCellReuseIdentifier: "FriendsXib")
        // Do any additional setup after loading the view.
        filtredProfile = friend
    }
    
}
extension ProfileFriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filtredProfile.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsXib", for: indexPath) as! XibFriendsTableViewCell
        //стандартная настройка ячейки. Можно изменить на другие типы ячеек, чтобы привести к тому виду, который необходим
        let content = cell
        content.FriendsVibLabel.text = filtredProfile[indexPath.row].name
        content.FriendsXibImage.image = filtredProfile[indexPath.row].image
        cell.contentConfiguration = content as? UIContentConfiguration
        return cell
    }
}

extension ProfileFriendsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText .isEmpty {
            filtredProfile = friend
        }else{
            filtredProfile = friend.filter{$0.name.contains(searchText)}
        }
        TableView.reloadData()
    }
    
    
}


