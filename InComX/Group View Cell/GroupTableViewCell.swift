//
//  GroupTableViewCell.swift
//  InComX
//
//  Created by Виктор Плесовских on 27.06.2022.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    @IBOutlet var ImageGroupTableViewCell: UIImageView!
    @IBOutlet var NameGroupTableGroupCell: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
