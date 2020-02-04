//
//  SlideUpMenu.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 7/2/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit

class SlideUpMenu:NSObject, UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    var viewController = UIViewController()
    
    let cellId = "cellId"
    
    let blackView = UIView()
    let whiteView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
       let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        return view
    }()
    
    let menus = [
        Menu(image: "icon_percetakan", tittle: "Percetakan"),
        Menu(image: "icon_riset", tittle: "Riset"),
        Menu(image: "icon_tv", tittle: "Bisnis TV"),
        Menu(image: "icon_langganan", tittle: "Langganan"),
        Menu(image: "icon_radio", tittle: "Radio")
    ]
    
    func showMenu(){
        
        if let window = UIApplication.shared.keyWindow {
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            window.addSubview(whiteView)
            
            let height:CGFloat = 300
            let y = window.frame.height - height
            whiteView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                self.whiteView.frame = CGRect(x: 0, y: y, width: self.whiteView.frame.width, height: self.whiteView.frame.height)
            }, completion: nil)
            
        }
        
    }
    
    @objc func handleDismiss(){
        UIView.animate(withDuration: 0.3) {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.whiteView.frame = CGRect(x: 0, y: window.frame.height, width: self.whiteView.frame.width, height: self.whiteView.frame.height)
            }
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProductCell
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            showContent(id: "17")
        case 1:
            showContent(id: "18")
        case 2:
            showContent(id: "11")
        default:
            print("default")
        }
    }
    
    func showContent(id:String){
        let htmlview = BaseHtmlViewController()
        htmlview.id = id
        viewController.navigationController?.pushViewController(htmlview, animated: true)
        handleDismiss()
    }
    
    
    
    override init() {
        super.init()
        whiteView.dataSource = self
        whiteView.delegate = self
        whiteView.register(ProductCell.self, forCellWithReuseIdentifier: cellId)
    }
}
