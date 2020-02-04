//
//  MediaSocialController.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 7/1/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit
import ImageSlideshow

class MediaSocialController:BaseViewController {
    
    let headerImage:UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "produk_sosial_media"))
        return image
    }()
    
    let tombolSosmed: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "optimalisasi_branding_di_sosoal_media"), for: .normal)
        button.addTarget(self, action: #selector(brandingAction), for: .touchUpInside)
        return button
    }()
    
    let tombolAktivasi: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "aktivasi_medsos"), for: .normal)
        button.addTarget(self, action: #selector(aktivasiAction), for: .touchUpInside)
        return button
    }()
    
    let tombolGoogle: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "optimlisasi_branding_di_google_search"), for: .normal)
        button.addTarget(self, action: #selector(googleAction), for: .touchUpInside)
        return button
    }()
    
    let tombolYoutube: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "optimalisasi_branding_di_youtube_dan_sosmed"), for: .normal)
        button.addTarget(self, action: #selector(youtubeAction), for: .touchUpInside)
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
        [tombolAktivasi,
         tombolGoogle,
         tombolYoutube,
         tombolSosmed,
            ].forEach(view.addSubview(_:))
        
        let buttonSize = tombolAktivasi.currentImage?.aspectRatio(multiplier: 0.7, of: view)
        
        tombolAktivasi.anchor(top: headerImage.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 32, left: 0, bottom: 0, right: 0), size: buttonSize!)
        
        tombolAktivasi.anchorCenter(horizontal: view.centerXAnchor, vertical: nil)
        
        tombolGoogle.anchorBottom(to: tombolAktivasi, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: buttonSize!)
        
        tombolYoutube.anchorBottom(to: tombolGoogle, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: buttonSize!)
        
        tombolSosmed.anchorBottom(to: tombolYoutube, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: buttonSize!)
     
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
        
        slideShow.anchor(top: tombolSosmed.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 32, left: 16, bottom: 0, right: 16), size: iklanSize!)
        
    }
    
    func setupHeader(){
        
        view.addSubview(headerImage)
        let headerImageSize = headerImage.image?.aspectRatio(multiplier: 1,of: view)
        headerImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,size:headerImageSize!)
        
    }
    
    @objc func aktivasiAction(){
        let htmlview = BaseHtmlViewController()
        htmlview.id = "28"
        self.navigationController?.pushViewController(htmlview, animated: true)
    }
    
    @objc func googleAction(){
        let htmlview = BaseHtmlViewController()
        htmlview.id = "31"
        self.navigationController?.pushViewController(htmlview, animated: true)
    }
    
    @objc func youtubeAction(){
        let htmlview = BaseHtmlViewController()
        htmlview.id = "29"
        self.navigationController?.pushViewController(htmlview, animated: true)
    }
    
    @objc func brandingAction(){
        let htmlview = BaseHtmlViewController()
        htmlview.id = "30"
        self.navigationController?.pushViewController(htmlview, animated: true)
    }

}
