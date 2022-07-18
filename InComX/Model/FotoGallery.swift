//
//  FotoGallery.swift
//  InComX
//
//  Created by Виктор Плесовских on 16.07.2022.
//

import Foundation
import UIKit

class FotoGallery{
    var images = [UIImage]()
    init () {
        setupGallery()
    }
    func setupGallery(){
        for i in 24...30 {
            let image = UIImage(named: "image\(i)")!
            images.append(image)
        }
    }
}
