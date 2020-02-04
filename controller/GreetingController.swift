//
//  GreetingController.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 6/13/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit
import ImageSlideshow
import Alamofire

class GreetingController : UITabBarController {
    
    let greetingView : UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "judul_greeting"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let terpaduButton:UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "tombol_solusi_media_terpadu"), for: .normal)
        button.addTarget(self, action: #selector(solusiMediaTerpadu), for: .touchUpInside)
        return button
    }()
    
    let produkButton:UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "tombol_produk_kami"), for: .normal)
        button.addTarget(self, action: #selector(goToProduk(sender:)), for: .touchUpInside)
        return button
    }()
    
    let hubungiButton:UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "tombol_hubungi_kami"), for: .normal)
        button.addTarget(self, action: #selector(hubungiKamiAction), for: .touchUpInside)
        return button
    }()
    
    let iklan: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "iklan"))
        return image
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        setupNavigation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let produkCV = ProdukController()
        
        produkCV.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        tabBarController?.viewControllers = [produkCV]

        
        [greetingView,
         terpaduButton,
         produkButton,
         hubungiButton,
         ].forEach(view.addSubview(_:))
        
        let greetingAspectRatio = greetingView.image?.aspectRatio(multiplier: 0.5, of: view)
        
        greetingView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing:nil,padding: .init(top: 32, left: 0, bottom: 0, right: 0),size: greetingAspectRatio!)
        
        greetingView.anchorCenter(horizontal: view.centerXAnchor, vertical: nil)
        
        let terpaduButtonAspectRatio = terpaduButton.currentImage?.aspectRatio(multiplier: 0.7, of: view)
        
        terpaduButton.anchor(top: greetingView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 32, left: 0, bottom: 0, right: 0), size: terpaduButtonAspectRatio!)
        
        terpaduButton.anchorCenter(horizontal: view.centerXAnchor, vertical: nil)
        
        produkButton.anchorBottom(to: terpaduButton, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: terpaduButtonAspectRatio!)
        
        hubungiButton.anchorBottom(to: produkButton, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: terpaduButtonAspectRatio!)
        
        let iklanSize = iklan.image?.aspectRatio(multiplier: 1, of: view)
        
        let slideShow = ImageSlideshow()
//        let localSource = [ImageSource(imageString: "iklan")!, ImageSource(imageString: "iklan")!, ImageSource(imageString: "iklan")!, ImageSource(imageString: "iklan")!]
//
//        slideShow.setImageInputs(localSource)
        
        NetworkUtils().fetchData(endPoint: "advert", completion: {
            (response: BaseResponse<[String]>) in
            
            let image = response.data.map({ (url) -> AlamofireSource in
                AlamofireSource(urlString: url)!
            })
            
            slideShow.setImageInputs(image)

        }) { (error) in
            print("fetch iklan error")
        }
        
        view.addSubview(slideShow)

        slideShow.anchor(top: hubungiButton.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 32, left: 16, bottom: 0, right: 16), size: iklanSize!)
        

    }
    
    func setupNavigation(){
        let labelTitle = UILabel()
        let user = UserDefaults().getUserData()
        let userNameSplit = user.name.split(separator: " ")
        labelTitle.text = "Hello \(userNameSplit[0])!"
        labelTitle.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        labelTitle.font = UIFont.boldSystemFont(ofSize: 16)
        navigationItem.titleView = labelTitle
        
        let logoImage = UIImageView(image: #imageLiteral(resourceName: "logo_bisnis"))
        logoImage.sizeThatFits(CGSize(width: 50, height: 50))
        let logoButton = UIBarButtonItem(customView: logoImage)
        navigationItem.setRightBarButton(logoButton, animated: true)
        
        let logoImageAspectRatio = logoImage.image?.aspectRatio(multiplier: 0.18,of: view)
        logoImage.anchorSize(size: logoImageAspectRatio!)
    }
    
    
    @IBAction func goToProduk(sender:UIButton){
        let productController = ProdukController(collectionViewLayout: UICollectionViewFlowLayout())
        self.navigationController?.pushViewController(productController, animated: true)
    }
    
    @objc func hubungiKamiAction(){
        self.navigationController?.pushViewController(ContactUsController(), animated: true)
    }
    
    @objc func solusiMediaTerpadu(){
        let htmlview = BaseHtmlViewController()
        htmlview.id = "15"
        self.navigationController?.pushViewController(htmlview, animated: true)
    }
    
}
