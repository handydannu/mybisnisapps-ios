//
//  CustomTabarController.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 6/23/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        let greetingController = UINavigationController(rootViewController: GreetingController())
        let image = UIImage(named: "icon_home")?.withRenderingMode(.alwaysOriginal)
        let gIm = image?.resizedImage(newSize: CGSize(width: 24, height: 24)).withRenderingMode(.alwaysOriginal)
        greetingController.tabBarItem.image = gIm
        greetingController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6,0)
        
        let profileController = ProfileController()
        let imageProfile = UIImage(named: "icon_profil")?.withRenderingMode(.alwaysOriginal)
        let pIm = imageProfile?.resizedImage(newSize: CGSize(width: 24, height: 24)).withRenderingMode(.alwaysOriginal)
        profileController.tabBarItem.image = pIm
        profileController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6,0)
        
        let keranjangController = UINavigationController(rootViewController: ChartController(collectionViewLayout: UICollectionViewFlowLayout()))
        let imageKeranjang = UIImage(named: "keranjang")?.withRenderingMode(.alwaysOriginal)
        let kIm = imageKeranjang?.resizedImage(newSize: CGSize(width: 24, height: 24)).withRenderingMode(.alwaysOriginal)
        keranjangController.tabBarItem.image = kIm
        keranjangController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6,0)
        
        let lainnyaController = UINavigationController(rootViewController: LainnyaController()) 
        let imageLainnya = UIImage(named: "icon_menu_lainnya")?.withRenderingMode(.alwaysOriginal)
        let lIm = imageLainnya?.resizedImage(newSize: CGSize(width: 24, height: 24)).withRenderingMode(.alwaysOriginal)
        lainnyaController.tabBarItem.image = lIm
        lainnyaController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6,0)

        viewControllers = [greetingController,profileController,keranjangController,lainnyaController]

    }
    
}
