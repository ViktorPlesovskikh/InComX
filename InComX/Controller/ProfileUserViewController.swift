//
//  ProfileUserViewController.swift
//  InComX
//
//  Created by Виктор Плесовских on 29.06.2022.
//

import UIKit

class ProfileUserViewController: UIViewController {


    @IBOutlet var myFoto: UICollectionView!
    let fotoGallery = FotoGallery()
    let identifife = "myFotoCollectionViewCell"
    let countCells = 3
    let ofset:CGFloat = 2.0
    
    @IBOutlet var imageProfileUser: UIImageView!
    @IBOutlet var NameUserLabel: UILabel!
    @IBOutlet var FamilyUserLabel: UILabel!
    @IBOutlet var CityUserLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageProfileUser.alpha = 0
        NameUserLabel.alpha = 0
        FamilyUserLabel.alpha = 0
        CityUserLabel.alpha = 0
        UIView.animate(withDuration: 1.5) {
            self.imageProfileUser.alpha = 1
            self.NameUserLabel.alpha = 1
            self.FamilyUserLabel.alpha = 1
            self.CityUserLabel.alpha = 1
        }
       
        myFoto.delegate = self
        myFoto.dataSource = self
        myFoto.register(UINib(nibName: "myFotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifife)
    }

}

extension ProfileUserViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return fotoGallery.images.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifife, for: indexPath) as! myFotoCollectionViewCell
    cell.fotoView.image = fotoGallery.images[indexPath.item]
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
