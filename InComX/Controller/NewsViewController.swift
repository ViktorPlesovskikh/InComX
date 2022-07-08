//
//  NewsViewController.swift
//  InComX
//
//  Created by Виктор Плесовских on 05.07.2022.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDataSource {
    
    let idCell = "NewsCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = UITableViewCell(style: .subtitle, reuseIdentifier: idCell)
        
        return Cell
    }
    
   

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        //tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
}


