//
//  NewsTableViewCell.swift
//  InComX
//
//  Created by Виктор Плесовских on 05.07.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet var NewsImage: UIImageView!
    @IBOutlet var NewsName: UILabel!
    @IBOutlet var NewsDescription: UILabel!
    
    
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
