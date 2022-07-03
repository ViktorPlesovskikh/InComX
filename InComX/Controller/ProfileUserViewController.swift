//
//  ProfileUserViewController.swift
//  InComX
//
//  Created by Виктор Плесовских on 29.06.2022.
//

import UIKit

class ProfileUserViewController: UIViewController {
    /*let profileUser = [
    ProfileUser (nameUser: "Viktor", imageUser: UIImage(named: "Profile_image"), cityUser: "Sakhalin")
    ]
    */
    
    
    @IBOutlet var imageProfileUser: UIImageView!
    @IBOutlet var NameUserLabel: UILabel!
    @IBOutlet var FamilyUserLabel: UILabel!
   
    @IBOutlet var CityUserLabel: UILabel!
    
    @IBAction func MyPhotoCollect(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //imageProfileUser.layer.borderWidth = 4.0
        //imageProfileUser.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
