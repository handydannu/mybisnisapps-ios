//
//  ITSolutionController.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 7/2/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit
import  ImageSlideshow

class ITSolutionController: BaseViewController{
    
    let headerImage:UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "header_bg_produk"))
        return image
    }()
    
    let judul:UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "produk_it_solution"))
        return image
    }()
    
    let tombolWebDev: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "tombol_webdev"), for: .normal)
        button.addTarget(self, action: #selector(devAction), for: .touchUpInside)
        return button
    }()
    
    let tombolWebDes: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "tombol_webdes"), for: .normal)
        button.addTarget(self, action: #selector(desAction), for: .touchUpInside)
        return button
    }()
    
    let tombolWebMain: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "tombol_webmain"), for: .normal)
        button.addTarget(self, action: #selector(mainAction), for: .touchUpInside)
        return button
    }()
    
    
    let iklan: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "iklan"))
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigation()
        setupHeader()
        setupMenu()
    }
    
    func setupMenu(){
        [tombolWebDev,
         tombolWebDes,
         tombolWebMain,
            ].forEach(view.addSubview(_:))
        
        let buttonSize = tombolWebDev.currentImage?.aspectRatio(multiplier: 0.7, of: view)
        
        tombolWebDev.anchor(top: headerImage.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 32, left: 0, bottom: 0, right: 0), size: buttonSize!)
        
        tombolWebDev.anchorCenter(horizontal: view.centerXAnchor, vertical: nil)
        
        tombolWebDes.anchorBottom(to: tombolWebDev, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: buttonSize!)
        
        tombolWebMain.anchorBottom(to: tombolWebDes, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: buttonSize!)
        
        let iklanSize = iklan.image?.aspectRatio(multiplier: 1, of: view)
        
        let slideShow = ImageSlideshow()
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
        
        slideShow.anchor(top: tombolWebMain.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 32, left: 16, bottom: 0, right: 16), size: iklanSize!)
        
    }
    
    func setupHeader(){
        
        view.addSubview(headerImage)
        let headerImageSize = headerImage.image?.aspectRatio(multiplier: 1,of: view)
        headerImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,size:headerImageSize!)
        
        headerImage.addSubview(judul)
        let judulSize = judul.image?.aspectRatio(multiplier: 0.25,of: headerImage)
        judul.anchor(top: headerImage.topAnchor, leading: headerImage.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: ((headerImageSize?.height)! - (judulSize?.height)!) * 0.5, left: 16, bottom: 0, right: 0), size: judulSize!)
    }
    
    @objc func devAction(){
        let htmlview = BaseHtmlViewController()
        htmlview.id = "33"
        self.navigationController?.pushViewController(htmlview, animated: true)
    }
    
    @objc func desAction(){
        let htmlview = BaseHtmlViewController()
        htmlview.id = "32"
        self.navigationController?.pushViewController(htmlview, animated: true)
    }
    
    @objc func mainAction(){
        let htmlview = BaseHtmlViewController()
        htmlview.id = "34"
        self.navigationController?.pushViewController(htmlview, animated: true)
    }
    
    
    
}
