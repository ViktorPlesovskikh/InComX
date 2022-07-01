//
//  ProfileFriendsViewController.swift
//  InComX
//
//  Created by Виктор Плесовских on 27.06.2022.
//

import UIKit

class ProfileFriendsViewController: UIViewController {
    
    var friend = [
        Friends(name: "Олеся", image: UIImage(named: "image6")),
        Friends(name: "Иван", image: UIImage(named: "image2")),
        Friends(name: "Олег", image: UIImage(named: "image3")),
        Friends(name: "Петр", image: UIImage(named: "image4")),
        Friends(name: "Игорь", image: UIImage(named: "image5")),
        Friends(name: "Павел", image: UIImage(named: "image6")),
        
    ]
    @IBOutlet var TableView: UITableView! {
        didSet {
            TableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

}
extension ProfileFriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friend.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileFriends", for: indexPath)
        //стандартная настройка ячейки
        var content = cell.defaultContentConfiguration()
        content.text = friend[indexPath.row].name
        content.image = friend[indexPath.row].image
        cell.contentConfiguration = content
        
        
        return cell
    }
}
