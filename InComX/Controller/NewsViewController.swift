//
//  NewsViewController.swift
//  InComX
//
//  Created by Виктор Плесовских on 05.07.2022.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let idCell = "NewsCell"
    let myRefreshControl: UIRefreshControl = {
        
    let refreshControl = UIRefreshControl()
        
        refreshControl.addTarget(NewsViewController.self, action: #selector(refresh(sender:)), for: .valueChanged)
        return refreshControl
    }()
    
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
        tableView.delegate = self
       
        tableView.refreshControl = myRefreshControl
        // Do any additional setup after loading the view.
    }
    @objc private func refresh(sender: UIRefreshControl) {
        sender.endRefreshing()
    }
   
}


