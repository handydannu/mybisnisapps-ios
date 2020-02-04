//
//  ContactUsController.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 6/22/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit

class ContactUsController: BaseViewController{
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigation()
        
        let scrollView = UIScrollView()
        let scrollWrapper = UIView()
        
        view.addSubview(scrollView)
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        
        scrollView.addSubview(scrollWrapper)
        
        scrollWrapper.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor)
        scrollWrapper.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollWrapper.heightAnchor.constraint(equalToConstant: 2750).isActive = true
        
        let headerImage = UIImageView(image: #imageLiteral(resourceName: "header_bg_produk"))
        scrollWrapper.addSubview(headerImage)
        let headerImageSize = headerImage.image?.aspectRatio(multiplier: 1,of: view)
        headerImage.anchor(top: scrollWrapper.topAnchor, leading: scrollWrapper.leadingAnchor, bottom: nil, trailing: scrollWrapper.trailingAnchor,size:headerImageSize!)
        
        let judul = UIImageView(image: #imageLiteral(resourceName: "judul_kontak"))
        headerImage.addSubview(judul)
        let judulSize = judul.image?.aspectRatio(multiplier: 0.25,of: headerImage)
        judul.anchor(top: headerImage.topAnchor, leading: headerImage.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: ((headerImageSize?.height)! - (judulSize?.height)!) * 0.5, left: 16, bottom: 0, right: 0), size: judulSize!)
        
        let kantorPusat = UIImageView(image: #imageLiteral(resourceName: "alamat_kantor_pusat"))
        scrollWrapper.addSubview(kantorPusat)
        let kantorPusatSize = kantorPusat.image?.aspectRatio(multiplier: 0.5, of: view)
        kantorPusat.anchor(top: headerImage.bottomAnchor, leading: scrollWrapper.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 8, bottom: 0, right: 8), size: kantorPusatSize!)
        
        let peta = UIImageView(image: #imageLiteral(resourceName: "peta"))
        scrollWrapper.addSubview(peta)
        let petaSize = peta.image?.aspectRatio(multiplier: 1, of: view)
        peta.anchor(top: kantorPusat.bottomAnchor, leading: scrollWrapper.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 0, bottom: 0, right: 0),size: petaSize!)
        
        let judulPerwakilan = UIImageView(image: #imageLiteral(resourceName: "kantor_perwakilan"))
        scrollWrapper.addSubview(judulPerwakilan)
        judulPerwakilan.anchor(top: peta.bottomAnchor, leading: scrollWrapper.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 8, bottom: 0, right: 0))
        
        let medan = UIImageView(image: #imageLiteral(resourceName: "medan"))
        scrollWrapper.addSubview(medan)
        medan.anchor(top: judulPerwakilan.bottomAnchor, leading: scrollWrapper.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 8, bottom: 0, right: 0))
        
        let judulUnit = UIImageView(image: #imageLiteral(resourceName: "unit_bisnis"))
        scrollWrapper.addSubview(judulUnit)
        judulUnit.anchor(top: medan.bottomAnchor, leading: scrollWrapper.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 8, bottom: 0, right: 0))
        
        let judulUnitContent = UIImageView(image:#imageLiteral(resourceName: "unit_bisnis_content"))
        scrollWrapper.addSubview(judulUnitContent)
        judulUnitContent.anchor(top: judulUnit.bottomAnchor, leading: scrollWrapper.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 8, bottom: 0, right: 0))
        
        let judulPercetakan = UIImageView(image: #imageLiteral(resourceName: "percetakan"))
        scrollWrapper.addSubview(judulPercetakan)
        judulPercetakan.anchor(top: judulUnitContent.bottomAnchor, leading: scrollWrapper.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 8, bottom: 0, right: 0))
        
        let percetakanContent = UIImageView(image:#imageLiteral(resourceName: "percetakan_content"))
        scrollWrapper.addSubview(percetakanContent)
        percetakanContent.anchor(top: judulPercetakan.bottomAnchor, leading: scrollWrapper.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 8, bottom: 0, right: 0))
        
        let judulRegional = UIImageView(image: #imageLiteral(resourceName: "koran_regional"))
        scrollWrapper.addSubview(judulRegional)
        judulRegional.anchor(top: percetakanContent.bottomAnchor, leading: scrollWrapper.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 8, bottom: 0, right: 0))
        
        let RegionalContent = UIImageView(image:#imageLiteral(resourceName: "koran_content"))
        scrollWrapper.addSubview(RegionalContent)
        RegionalContent.anchor(top: judulRegional.bottomAnchor, leading: scrollWrapper.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 8, bottom: 0, right: 0))
        
        
    }
    
}
