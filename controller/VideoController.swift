//
//  VideoController.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 7/1/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit
import ImageSlideshow

class VideoController:BaseViewController {
    
    let headerImage:UIImageView = {
       let image = UIImageView(image: #imageLiteral(resourceName: "header_bg_produk"))
        return image
    }()
    
    let judul:UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "produk_video"))
        return image
    }()
    
    let tombolPresentasi: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "tombol_presentasi"), for: .normal)
        button.addTarget(self, action: #selector(presentasi), for: .touchUpInside)
        return button
    }()
    
    let tombolDokumentasi: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "tombol_dokumentasi"), for: .normal)
        button.addTarget(self, action: #selector(dokumentasi), for: .touchUpInside)
        return button
    }()
    
    let tombolSosialisasi: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "tombol_sosialisasi"), for: .normal)
        button.addTarget(self, action: #selector(kampanye), for: .touchUpInside)
        return button
    }()
    
    let tombolCompany: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "tombol_company_profile"), for: .normal)
        button.addTarget(self, action: #selector(company), for: .touchUpInside)
        return button
    }()
    
    let tombolAds: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "tombol_video_ads"), for: .normal)
        button.addTarget(self, action: #selector(komersial), for: .touchUpInside)
        return button
    }()
    
    let tombolShortMovie: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "tombol_short_movie"), for: .normal)
        button.addTarget(self, action: #selector(shortMovie), for: .touchUpInside)
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
        [tombolPresentasi,
         tombolDokumentasi,
         tombolSosialisasi,
         tombolCompany,
         tombolAds,
         tombolShortMovie,
        ].forEach(view.addSubview(_:))
        
        let buttonSize = tombolPresentasi.currentImage?.aspectRatio(multiplier: 0.7, of: view)
        
        tombolPresentasi.anchor(top: headerImage.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 32, left: 0, bottom: 0, right: 0), size: buttonSize!)
        
        tombolPresentasi.anchorCenter(horizontal: view.centerXAnchor, vertical: nil)
        
        tombolDokumentasi.anchorBottom(to: tombolPresentasi, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: buttonSize!)
        
        tombolSosialisasi.anchorBottom(to: tombolDokumentasi, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: buttonSize!)
        
        tombolCompany.anchorBottom(to: tombolSosialisasi, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: buttonSize!)
        
        tombolAds.anchorBottom(to: tombolCompany, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: buttonSize!)
        
        tombolShortMovie.anchorBottom(to: tombolAds, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: buttonSize!)
        
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
        
        slideShow.anchor(top: tombolShortMovie.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 32, left: 16, bottom: 0, right: 16), size: iklanSize!)
        
    }
    
    func setupHeader(){
        
        view.addSubview(headerImage)
        let headerImageSize = headerImage.image?.aspectRatio(multiplier: 1,of: view)
        headerImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,size:headerImageSize!)
        
        headerImage.addSubview(judul)
        let judulSize = judul.image?.aspectRatio(multiplier: 0.25,of: headerImage)
        judul.anchor(top: headerImage.topAnchor, leading: headerImage.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: ((headerImageSize?.height)! - (judulSize?.height)!) * 0.5, left: 16, bottom: 0, right: 0), size: judulSize!)
    }

    
    @objc func presentasi(){
//        let videoContentController = VideoContentController(collectionViewLayout: UICollectionViewFlowLayout())
//        videoContentController.judul = "judul_presentasi"
//        videoContentController.id = "9"
        let htmlview = BaseHtmlViewController()
        htmlview.id = "9"
        self.navigationController?.pushViewController(htmlview, animated: true)
//        self.navigationController?.pushViewController(videoContentController, animated: true)
    }
    
    @objc func dokumentasi(){
//        let videoContentController = VideoContentController(collectionViewLayout: UICollectionViewFlowLayout())
        let htmlview = BaseHtmlViewController()
        htmlview.id = "36"
        self.navigationController?.pushViewController(htmlview, animated: true)
//        videoContentController.id = "36"
//        videoContentController.judul = "judul_dokumentasi"
//        self.navigationController?.pushViewController(videoContentController, animated: true)
    }
    
    @objc func kampanye(){
//        let videoContentController = VideoContentController(collectionViewLayout: UICollectionViewFlowLayout())
        let htmlview = BaseHtmlViewController()
        htmlview.id = "37"
        self.navigationController?.pushViewController(htmlview, animated: true)
//        videoContentController.judul = "judul_kampanye"
//        videoContentController.id = "37"
//
//        self.navigationController?.pushViewController(videoContentController, animated: true)
    }
    
    @objc func company(){
//        let videoContentController = VideoContentController(collectionViewLayout: UICollectionViewFlowLayout())
        let htmlview = BaseHtmlViewController()
        htmlview.id = "38"
        self.navigationController?.pushViewController(htmlview, animated: true)
//        videoContentController.judul = "judul_company"
//        videoContentController.id = "38"
//        self.navigationController?.pushViewController(videoContentController, animated: true)
    }
    
    @objc func komersial(){
//        let videoContentController = VideoContentController(collectionViewLayout: UICollectionViewFlowLayout())
        
        let htmlview = BaseHtmlViewController()
        htmlview.id = "39"
        self.navigationController?.pushViewController(htmlview, animated: true)
//        videoContentController.judul = "judul_komersial"
//        videoContentController.id = "39"
//
//        self.navigationController?.pushViewController(videoContentController, animated: true)
    }
    
    @objc func shortMovie(){
//        let videoContentController = VideoContentController(collectionViewLayout: UICollectionViewFlowLayout())
        let htmlview = BaseHtmlViewController()
        htmlview.id = "40"
        self.navigationController?.pushViewController(htmlview, animated: true)
//        videoContentController.judul = "judul_short_movie"
//        videoContentController.id = "40"
//
//        self.navigationController?.pushViewController(videoContentController, animated: true)
    }
}
