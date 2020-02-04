//
//  IklanCetakController.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 7/12/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit

class IklanHeaderCell : UICollectionViewCell {
    
    let headerImage:UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "header_bg_produk"))
        return image
    }()
    
    let judul:UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "produk_iklan_cetak"))
        return image
    }()
    
    func setupHeader(){
        
        addSubview(headerImage)
        let headerImageSize = headerImage.image?.aspectRatio(multiplier: 1,of: self)
        headerImage.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,size:headerImageSize!)
        
        headerImage.addSubview(judul)
        let judulSize = judul.image?.aspectRatio(multiplier: 0.30,of: headerImage)
        judul.anchor(top: headerImage.topAnchor, leading: headerImage.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: ((headerImageSize?.height)! - (judulSize?.height)!) * 0.5, left: 16, bottom: 0, right: 0), size: judulSize!)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHeader()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class IklanCetakController:UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let menus = [
        Menu(image: "icon_permintaan_khusus", tittle: "Permintaan Khusus"),
        Menu(image: "icon_diskon_penjualan", tittle: "Diskon Penjualan"),
        Menu(image: "icon_iklan_umum", tittle: "Iklan Umum"),
        Menu(image: "icon_iklan_spesifikasi", tittle: "Iklan Spesifikasi"),
        Menu(image: "icon_iklan_khusus", tittle: "Iklan Khusus"),
        Menu(image: "icon_bi_weekend", tittle: "Bisnis Indonesia Weekend"),
        Menu(image: "icon_iklan_paket", tittle: "Iklan Paket"),
        Menu(image: "icon_iklan_jaket", tittle: "Iklan Jaket"),
        Menu(image: "icon_iklan_devider", tittle: "Iklan Divider"),
        Menu(image: "icon_iklan_klasifikasi", tittle: "Iklan Klasifikasi")

        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        collectionView?.backgroundColor = .white
        
        collectionView?.register(ProductCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.register(IklanHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId")
        collectionView?.register(ProductFooterCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footerId")
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ProductCell
        cell.menuItem = menus[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let gridCount = CGFloat(3)
        let widthEachItem = (collectionView.bounds.width / gridCount) - 16 - 8
        return CGSize(width: widthEachItem, height: widthEachItem )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId", for: indexPath)
        }
        else {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footerId", for: indexPath)
            return footerView
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 200)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            let htmlview = BaseHtmlViewController()
            htmlview.id = "27"
            self.navigationController?.pushViewController(htmlview, animated: true)
        case 1:
            let htmlview = BaseHtmlViewController()
            htmlview.id = "21"
            self.navigationController?.pushViewController(htmlview, animated: true)
        case 2:
            let htmlview = BaseHtmlViewController()
            htmlview.id = "24"
            self.navigationController?.pushViewController(htmlview, animated: true)
        case 3:
            let htmlview = BaseHtmlViewController()
            htmlview.id = "23"
            self.navigationController?.pushViewController(htmlview, animated: true)
        case 4:
            let htmlview = BaseHtmlViewController()
            htmlview.id = "41"
            self.navigationController?.pushViewController(htmlview, animated: true)
        case 5:
            let htmlview = BaseHtmlViewController()
            htmlview.id = "19"
            self.navigationController?.pushViewController(htmlview, animated: true)
        case 6:
            let htmlview = BaseHtmlViewController()
            htmlview.id = "22"
            self.navigationController?.pushViewController(htmlview, animated: true)
        case 7:
            let htmlview = BaseHtmlViewController()
            htmlview.id = "25"
            self.navigationController?.pushViewController(htmlview, animated: true)
        case 8:
            let htmlview = BaseHtmlViewController()
            htmlview.id = "20"
            self.navigationController?.pushViewController(htmlview, animated: true)
        case 9:
            let htmlview = BaseHtmlViewController()
            htmlview.id = "26"
            self.navigationController?.pushViewController(htmlview, animated: true)
        default:
            print("default")
        }
    }
    
    func setupNavigation(){
        let labelTitle = UILabel()
        let user = UserDefaults().getUserData()
        labelTitle.text = "Hello \(user.name)!"
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
    
}
