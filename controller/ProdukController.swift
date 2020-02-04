//
//  ProdukController.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 6/14/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit
import ImageSlideshow
import Alamofire


class ProductCell: UICollectionViewCell {
    
    var menuItem:Menu? {
        didSet{
            guard let unwrapMenu = menuItem else {return}
            
            menu.image = UIImage(named: unwrapMenu.image)
            title.text = unwrapMenu.tittle
        }
    }
    
    private let menu: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "icon_video")
        return image
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.text = "Video"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(menu)
        addSubview(title)
        menu.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 8, left: 8, bottom: 8, right: 8))
        
        title.anchor(top: menu.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 8, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ProductFooterCell: UICollectionViewCell {
    
    
    let iklan: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "iklan"))
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let view = UIView()
        view.frame = frame
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
        
        addSubview(slideShow)
        
        slideShow.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 32, left: 16, bottom: 0, right: 16), size: iklanSize!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ProductHeaderCell : UICollectionViewCell {
    
    var judulString:String? {
        didSet{
            guard let unwrapJudul = judulString else {return}
            judul.image = UIImage(named: unwrapJudul)
        }
    }
    
    let judul: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "judul_produk")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(judul)
        
        if let size = judul.image?.aspectRatio(multiplier: 0.35, of: self) {
                         judul.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 16, bottom: 0, right: 0), size: size)
                    }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class ProdukController : UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let menus = [
        Menu(image:"icon_video", tittle: "video"),
        Menu(image: "icon_media_sosial", tittle: "Media Sosial"),
        Menu(image: "icon_iklan", tittle: "Iklan"),
        Menu(image: "icon_it_solution", tittle: "IT Solution"),
        Menu(image: "icon_corporate_brand", tittle: "Corp. Branding"),
        Menu(image: "icon_epapers", tittle: "E-Pappers"),
        Menu(image: "icon_buku", tittle: "Buku"),
        Menu(image: "icon_eo", tittle: "EO"),
        Menu(image: "icon_lainnya", tittle: "Lainnya...")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        collectionView?.backgroundColor = .white
        
        collectionView?.register(ProductCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.register(ProductHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId")
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
        return CGSize(width: collectionView.bounds.width, height: 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 200)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            self.navigationController?.pushViewController(VideoController(), animated: true)
        case 1:
            self.navigationController?.pushViewController(MediaSocialController(), animated: true)
        case 2:
            self.navigationController?.pushViewController(IklanController(), animated: true)
        case 3:
            self.navigationController?.pushViewController(ITSolutionController(), animated: true)
        case 4:
            let htmlview = BaseHtmlViewController()
            htmlview.id = "12"
            self.navigationController?.pushViewController(htmlview, animated: true)
        case 5:
            self.navigationController?.pushViewController(EPapersController(), animated: true)
        case 6:
            let htmlview = BaseHtmlViewController()
            htmlview.id = "10"
            self.navigationController?.pushViewController(htmlview, animated: true)
        case 7:
            let htmlview = BaseHtmlViewController()
            htmlview.id = "13"
            self.navigationController?.pushViewController(htmlview, animated: true)
        case 8:
            handleSlideUpMenu()
        default:
            print("default")
        }
    }

    let slideUpMenu = SlideUpMenu()
    
    func handleSlideUpMenu(){
        slideUpMenu.viewController = self
       slideUpMenu.showMenu()
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
}
