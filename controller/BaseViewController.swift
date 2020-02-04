//
//  BaseViewController.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 7/11/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit

class BaseViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
    
    func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
    

}
