//
//  EPapersController.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 7/12/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit

class EPapersController : BaseViewController {
    
  
    
    let headerImage:UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "header_bg_produk"))
        return image
    }()
    
    let judul:UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "judul_kategori"))
        return image
    }()
    
    let alert = UIAlertController(title: "Success", message: "Success order product", preferredStyle: UIAlertControllerStyle.alert)
    
    let textHeader:UILabel = {
        let label = UILabel()
        label.text = "ePapper Bisnis Indonesia adalah versi digital koran Bisnis Indonesia, yang bisa diakses dengan komputer, laptop, tablet, dan smarphone."
        label.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 5
        return label
    }()
    
    let basicImage : UIImageView = {
        let basicImage = UIImageView()
        basicImage.loadImageUsingUrlString(urlString: "https://image.ibb.co/k92zwd/basic.png")
        basicImage.contentMode = .scaleAspectFit
        return basicImage
    }()
    
    let silverImage : UIImageView = {
        let Image = UIImageView()
        Image.loadImageUsingUrlString(urlString: "https://image.ibb.co/mWW3NJ/45_rp_600_000.png")
        Image.contentMode = .scaleAspectFit
        return Image
    }()
    
    let goldImage : UIImageView = {
        let Image = UIImageView()
        Image.loadImageUsingUrlString(urlString: "https://image.ibb.co/eTz19y/75_rp_1_000_000.png")
        Image.contentMode = .scaleAspectFit
        return Image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupHeader()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        view.addSubview(textHeader)
        
        textHeader.anchor(top: headerImage.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 8))
        
        setupImage()
        
        
        
    }
    
    fileprivate func setupImage(){
        let basicContainerView = UIView()
        
        basicContainerView.addSubview(basicImage)
        
        basicImage.anchor(top: basicContainerView.topAnchor, leading: basicContainerView.leadingAnchor, bottom: basicContainerView.bottomAnchor, trailing: basicContainerView.trailingAnchor)
        
        let silverContainerView = UIView()
        
        silverContainerView.addSubview(silverImage)
        
        silverImage.anchor(top: silverContainerView.topAnchor, leading: silverContainerView.leadingAnchor, bottom: silverContainerView.bottomAnchor, trailing: silverContainerView.trailingAnchor)
        
        let goldContainerView = UIView()
        
        goldContainerView.addSubview(goldImage)
        
        goldImage.anchor(top: goldContainerView.topAnchor, leading: goldContainerView.leadingAnchor, bottom: goldContainerView.bottomAnchor, trailing: goldContainerView.trailingAnchor)
        
        
        let imageStackView = UIStackView(arrangedSubviews: [basicContainerView,silverContainerView,goldContainerView])
        imageStackView.axis = .horizontal
        imageStackView.distribution = .fillEqually
        
        view.addSubview(imageStackView)
        
        imageStackView.anchor(top: textHeader.bottomAnchor, leading: textHeader.leadingAnchor, bottom: nil, trailing: textHeader.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 100))
        
        
        
        let basicContainerDesView = UIView()
        
        let basicLabel = UILabel()
        basicLabel.text = "Duration: 30 Days \nView Full Edition \nFree Download \nClipping Pages \nDownload Perpage"
        basicLabel.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        basicLabel.lineBreakMode = .byWordWrapping
        basicLabel.numberOfLines = 6
        basicLabel.textAlignment = .center
        basicLabel.font = UIFont.systemFont(ofSize: 13)
        basicContainerDesView.addSubview(basicLabel)
        basicLabel.anchor(top: basicContainerDesView.topAnchor, leading: basicContainerDesView.leadingAnchor, bottom: nil, trailing: basicContainerDesView.trailingAnchor)
        
        let silverContainerDesView = UIView()
        
        let silverLabel = UILabel()
        silverLabel.text = "Duration: 180 Days \nView Full Edition \nFree Download \nClipping Pages \nDownload Perpage"
        silverLabel.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        silverLabel.lineBreakMode = .byWordWrapping
        silverLabel.numberOfLines = 6
        silverLabel.textAlignment = .center
        silverLabel.font = UIFont.systemFont(ofSize: 13)
        silverContainerDesView.addSubview(silverLabel)
        silverLabel.anchor(top: silverContainerDesView.topAnchor, leading: silverContainerDesView.leadingAnchor, bottom: nil, trailing: silverContainerDesView.trailingAnchor)
        
        let goldContainerDesView = UIView()
        
        let goldLabel = UILabel()
        goldLabel.text = "Duration: 365 Days \nView Full Edition \nFree Download \nClipping Pages \nDownload Perpage"
        goldLabel.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        goldLabel.lineBreakMode = .byWordWrapping
        goldLabel.numberOfLines = 6
        goldLabel.textAlignment = .center
        goldLabel.font = UIFont.systemFont(ofSize: 13)
        goldContainerDesView.addSubview(goldLabel)
        goldLabel.anchor(top: goldContainerDesView.topAnchor, leading: goldContainerDesView.leadingAnchor, bottom: nil, trailing: goldContainerDesView.trailingAnchor)
        
        let basicChart: UIButton = {
            let button = UIButton()
            button.setBackgroundImage(#imageLiteral(resourceName: "keranjang"), for: .normal)
            button.addTarget(self, action: #selector(orderBasic), for: .touchUpInside)
            return button
        }()
        
        let silverChart: UIButton = {
            let button = UIButton()
            button.setBackgroundImage(#imageLiteral(resourceName: "keranjang"), for: .normal)
            button.addTarget(self, action: #selector(orderSilver), for: .touchUpInside)
            return button
        }()
        
        let goldChart: UIButton = {
            let button = UIButton()
            button.setBackgroundImage(#imageLiteral(resourceName: "keranjang"), for: .normal)
            button.addTarget(self, action: #selector(orderGold), for: .touchUpInside)
            return button
        }()
        
        basicContainerDesView.addSubview(basicChart)
        silverContainerDesView.addSubview(silverChart)
        goldContainerDesView.addSubview(goldChart)
        
        basicChart.anchor(top: basicLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 8, left: 0, bottom: 0, right: 0),size: .init(width: 24, height: 24))
        
        basicChart.anchorCenter(horizontal: basicContainerDesView.centerXAnchor, vertical: nil)
        
        
        silverChart.anchor(top: silverLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 8, left: 0, bottom: 0, right: 0),size: .init(width: 24, height: 24))
        
        silverChart.anchorCenter(horizontal: silverContainerDesView.centerXAnchor, vertical: nil)
        
        
        goldChart.anchor(top: goldLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 8, left: 0, bottom: 0, right: 0),size: .init(width: 24, height: 24))
        
        goldChart.anchorCenter(horizontal: goldContainerDesView.centerXAnchor, vertical: nil)
        
        let descStack = UIStackView(arrangedSubviews: [basicContainerDesView,silverContainerDesView,goldContainerDesView])
        
        
        descStack.axis = .horizontal
        descStack.distribution = .fillEqually
        
        view.addSubview(descStack)
        
        descStack.anchor(top: imageStackView.bottomAnchor, leading: imageStackView.leadingAnchor, bottom: nil, trailing: imageStackView.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 200))
    }
   
    func setupHeader(){
        
        view.addSubview(headerImage)
        let headerImageSize = headerImage.image?.aspectRatio(multiplier: 1,of: view)
        headerImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,size:headerImageSize!)
        
        headerImage.addSubview(judul)
        let judulSize = judul.image?.aspectRatio(multiplier: 0.30,of: headerImage)
        judul.anchor(top: headerImage.topAnchor, leading: headerImage.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: ((headerImageSize?.height)! - (judulSize?.height)!) * 0.5, left: 16, bottom: 0, right: 0), size: judulSize!)
    }
    
    @objc func orderBasic(){
        showInputDialog(id: 14)
    }
    
    @objc func orderSilver(){
        showInputDialog(id: 14)
    }
    
    @objc func orderGold(){
        showInputDialog(id: 14)
    }
    
    func showInputDialog(id:Int) {
        //Creating UIAlertController and
        //Setting title and message for the alert dialog
        let alertController = UIAlertController(title: "Pesan produk ini?", message: "Jika ada keterangan silahkan input dibawah ini", preferredStyle: .alert)
        
        //the confirm action taking the inputs
        let confirmAction = UIAlertAction(title: "Order", style: .default) { (_) in
            let ket = alertController.textFields?[0].text
            
            let sv = self.displaySpinner(onView: self.view)
            let change = Order(description:ket!)
            let encoder = JSONEncoder()
            let data = try! encoder.encode(change)
            let json = String(data: data, encoding: .utf8)!
            let encryption = NetworkUtils().encrypt(plainText: json)
            guard let encryptData = "data=\(encryption)".data(using: .utf8) else {return}
            
            
            NetworkUtils().postData(endPoint: "product/\(id)/order", body: encryptData, completion: { (response: MinimumResponse) in
                self.present(self.alert, animated: true, completion: {
                    self.removeSpinner(spinner: sv)
                })            }) { (error) in
                    self.removeSpinner(spinner: sv)
            }
            
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        //adding textfields to our dialog box
        alertController.addTextField { (textField) in
            textField.placeholder = "Keterangan"
        }
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }

}
