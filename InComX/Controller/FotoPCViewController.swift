//
//  FotoPCViewController.swift
//  InComX
//
//  Created by Виктор Плесовских on 29.06.2022.
//

import UIKit

class FotoPCViewController: UIViewController {

    @IBOutlet var BackBarButtonItem: UIBarButtonItem!
    
    var images = [UIImage]()
    let countCells = 1//постоянное количество ячеек=2. Можно сделать любое
    let ofset: CGFloat = 2.0
   
    @IBOutlet var imageCollection: UICollectionView! {
            didSet {
                imageCollection.dataSource = self
                imageCollection.delegate = self
            }
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...30 {
            let image = UIImage(named: "image\(i)")!
            images.append(image)
        }

    }

}
extension FotoPCViewController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return images.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCollectionViewCell
    let image = images[indexPath.item]
    cell.FotoCollViewCell.image = image
    return cell
}

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame
        let withCell = frameCV.width/CGFloat(countCells)//для ширины ячейки
        let hieghtCell = withCell //Высота ячейки равна ширине
        //расчет отступов по краям экрана. Необходимо добавить в начале переменные.ВВЕРХУ!
        let spacing = CGFloat((countCells + 1)) * ofset / CGFloat(countCells)
        return CGSize(width: withCell - spacing, height: hieghtCell - (ofset * 2))
    }
}
