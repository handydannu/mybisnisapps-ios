//
//  IklanController.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 7/2/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit
import ImageSlideshow


class IklanController:BaseViewController{
    
    let headerImage:UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "header_bg_produk"))
        return image
    }()
    
    let judul:UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "produk_iklan"))
        return image
    }()
    
    let tombolCetak: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "iklan_cetak"), for: .normal)
        button.addTarget(self, action: #selector(iklanCetakAction), for: .touchUpInside)
        return button
    }()
    
    let tombolWeb: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "iklan_web"), for: .normal)
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
        [tombolCetak,
         tombolWeb,
            ].forEach(view.addSubview(_:))
        
        let buttonSize = tombolCetak.currentImage?.aspectRatio(multiplier: 0.7, of: view)
        
        tombolCetak.anchor(top: headerImage.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 32, left: 0, bottom: 0, right: 0), size: buttonSize!)
        
        tombolCetak.anchorCenter(horizontal: view.centerXAnchor, vertical: nil)
        
        tombolWeb.anchorBottom(to: tombolCetak, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: buttonSize!)
        
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
        
        slideShow.anchor(top: tombolWeb.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 32, left: 16, bottom: 0, right: 16), size: iklanSize!)
        
    }
    
    func setupHeader(){
        
        view.addSubview(headerImage)
        let headerImageSize = headerImage.image?.aspectRatio(multiplier: 1,of: view)
        headerImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,size:headerImageSize!)
        
        headerImage.addSubview(judul)
        let judulSize = judul.image?.aspectRatio(multiplier: 0.20,of: headerImage)
        judul.anchor(top: headerImage.topAnchor, leading: headerImage.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: ((headerImageSize?.height)! - (judulSize?.height)!) * 0.5, left: 16, bottom: 0, right: 0), size: judulSize!)
    }
    
    @objc func iklanCetakAction(){
        let iklanCetakController = IklanCetakController(collectionViewLayout: UICollectionViewFlowLayout())
        self.navigationController?.pushViewController(iklanCetakController, animated: true)
    }
    
    
    
}
