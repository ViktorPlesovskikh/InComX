//
//  FullScreenViewController.swift
//  InComX
//
//  Created by Виктор Плесовских on 14.07.2022.
//

import UIKit

class FullScreenViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    var fotoGallery: FotoGallery!
    let countCells = 1
    let identifire = "FullScreenCell"
    var indexPath:IndexPath!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "FullScreenCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifire)
        collectionView.performBatchUpdates(nil) {(Result) in
            self.collectionView.scrollToItem(at: self.indexPath, at: .centeredHorizontally, animated: false)
            
        }
    
    }
}
extension FullScreenViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return fotoGallery.images.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifire, for: indexPath) as! FullScreenCollectionViewCell
    cell.FotoCollViewCell.image = fotoGallery.images[indexPath.item]
    return cell
}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame
        let withCell = frameCV.width/CGFloat(countCells)//для ширины ячейки
        let hieghtCell = withCell //Высота ячейки равна ширине
        return CGSize(width: withCell, height: hieghtCell)
    }

}


