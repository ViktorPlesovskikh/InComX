//
//  FullScreenCollectionViewCell.swift
//  InComX
//
//  Created by Виктор Плесовских on 14.07.2022.
//

import UIKit

class FullScreenCollectionViewCell: UICollectionViewCell,UIScrollViewDelegate {

    @IBOutlet var FotoCollViewCell: UIImageView!
    
    @IBOutlet var scrollView: UIScrollView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.scrollView.delegate = self
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 5.0
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return FotoCollViewCell
    }
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        scrollView.zoomScale = 1.0
    }
}
