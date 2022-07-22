//
//  IndividualCollectionViewCell.swift
//  InComX
//
//  Created by Виктор Плесовских on 27.06.2022.
//

import UIKit

class IndividualCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var individualImageCell: UIImageView!
    @IBOutlet var individualFamilyCell: UILabel!
    @IBOutlet var individualNameCell: UILabel!
    @IBOutlet var likeControl: LikeControl!
    @IBOutlet var container: UIView!
    
    override func awakeFromNib() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.numberOfTapsRequired = 2
        container.addGestureRecognizer(tap)
    }
    @objc func handleTap(_: UIGestureRecognizer) {
        likeControl.isLike.toggle()
        if likeControl.isLike {
            likeControl.likePicture.image = UIImage(systemName: "suit.heart.fill")
        }else {
            likeControl.likePicture.image = nil
        }
    }
}
