//
//  LikeControl.swift
//  InComX
//
//  Created by Виктор Плесовских on 22.07.2022.
//

import UIKit

class LikeControl: UIControl {

    
    @IBOutlet var likePicture: UIImageView!
    var isLike: Bool = false
    override func awakeFromNib() {
        likePicture.backgroundColor = .clear
        likePicture.tintColor = .red
    }
    
}
