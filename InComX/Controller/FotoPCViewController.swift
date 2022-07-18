//
//  FotoPCViewController.swift
//  InComX
//
//  Created by Виктор Плесовских on 29.06.2022.
//

/*import UIKit

class FotoPCViewController: UIViewController {

   
    @IBOutlet var BackBarButtonItem: UIBarButtonItem!
    @IBOutlet var imageCollection: UICollectionView!

    let fotoGallery = FotoGallery()
    let countCells = 3
    let ofset:CGFloat = 2.0
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCollection.dataSource = self
        imageCollection.delegate = self
    }

}
extension FotoPCViewController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return fotoGallery.images.count
    //"numberOfItemsInSection"-количество элементов в секции
}
//"cellForItemAt indexPath:" Это ячейча по такому то пути. "indexPath" содержит в себе номер секции и номер ячейки.
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCollectionViewCell
    let image = fotoGallery.images[indexPath.item]
    cell.fotoView.image = image
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FullScreenViewController") as! FullScreenViewController
        vc.fotoGallery = fotoGallery
        vc.indexPath = indexPath
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
*/
