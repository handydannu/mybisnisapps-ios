//
//  ProfileController.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 7/2/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit

class ProfileController : BaseViewController{
    
    let background:UIImageView = {
       let image = UIImageView(image: #imageLiteral(resourceName: "back"))
        return image
    }()
    
    let profileImage:UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "user-profile"))
        return image
    }()
    
    private let name: UILabel = {
        let label = UILabel()
        label.text = "Steven Gerard"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        return label
    }()
    
    private let company: UILabel = {
        let label = UILabel()
        label.text = "Company"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        return label
    }()
    
    let emailImage:UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "icon_surat")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let emailTitle: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)
        return label
    }()
    
    let email: UILabel = {
        let label = UILabel()
        label.text = "Email@company.com"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)
        return label
    }()
    
    let addressImage:UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "icon_pointer")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let addressTitle: UILabel = {
        let label = UILabel()
        label.text = "Adress"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)
        return label
    }()
    
    let address: UILabel = {
        let label = UILabel()
        label.text = "Jln. Gerlong"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)
        return label
    }()
    
    let phoneImage:UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "icon_telepon")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let phoneTitle: UILabel = {
        let label = UILabel()
        label.text = "Phone"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)
        return label
    }()
    
    let phone: UILabel = {
        let label = UILabel()
        label.text = "2223 923455"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)
        return label
    }()
    
    let webImage:UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "icon_web")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let webTitle: UILabel = {
        let label = UILabel()
        label.text = "Web"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1)
        return label
    }()
    
    let web: UILabel = {
        let label = UILabel()
        label.text = "company.com"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor(red: 160/255, green: 160/255, blue: 160/255, alpha: 1)
        return label
    }()
    
    var scrollView: UIScrollView!
    var containerView = UIView()
    
    override func viewDidAppear(_ animated: Bool) {
        fetchData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.scrollView = UIScrollView()
        self.scrollView.contentSize = CGSize(width: view.bounds.width, height: 600)
        
        containerView = UIView()
        
        scrollView.addSubview(containerView)
        view.addSubview(scrollView)
        
        scrollView.frame = view.frame
        containerView.frame = view.frame
        
        let profilePic = UIView()
        profilePic.addSubview(profileImage)
        
        profileImage.anchor(top: profilePic.topAnchor, leading: profilePic.leadingAnchor, bottom: profilePic.bottomAnchor, trailing: profilePic.trailingAnchor)
        
        
        [background,
         profilePic,
         name,
         company,
         emailImage,
         emailTitle,
         email,
         addressImage,
         addressTitle,
         address,
         phoneImage,
         phoneTitle,
         phone,
//         webImage,
//         webTitle,
//         web,
        ].forEach(containerView.addSubview(_:))
        
        
        
        if let backgroundSize = background.image?.aspectRatio(multiplier: 1, of: view){
            background.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor,size:backgroundSize)
        }
        
        let picSize = 0.4 * view.bounds.width
        let halfBackground:CGFloat = background.frame.height * 0.3

        profilePic.anchor(top: background.topAnchor, leading: nil, bottom: nil, trailing: nil,padding: .init(top: halfBackground, left: 0, bottom: 0, right: 0), size: CGSize(width: picSize, height: picSize))
        
        profilePic.anchorCenter(horizontal: containerView.centerXAnchor, vertical: nil)
        
        name.anchor(top: profilePic.bottomAnchor, leading: nil, bottom: nil, trailing: nil,padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        
        name.anchorCenter(horizontal: containerView.centerXAnchor, vertical: nil)
        
        company.anchorBottom(to: name)
        company.anchorCenter(horizontal: containerView.centerXAnchor, vertical: nil)
        
        emailImage.anchor(top: company.bottomAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 34, left: 20, bottom: 0, right: 0), size: .init(width: 40, height: 40))
        
        emailTitle.anchor(top: emailImage.topAnchor, leading: emailImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        
        email.anchor(top: emailTitle.bottomAnchor, leading: emailTitle.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 2, left: 0, bottom: 0, right: 0))
        
        addressImage.anchor(top: emailImage.bottomAnchor, leading: emailImage.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: 40, height: 40))
        
        addressTitle.anchor(top: addressImage.topAnchor, leading: addressImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        
        address.anchor(top: addressTitle.bottomAnchor, leading: addressTitle.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 2, left: 0, bottom: 0, right: 0))
        
        phoneImage.anchor(top: addressImage.bottomAnchor, leading: addressImage.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: 40, height: 40))
        
        phoneTitle.anchor(top: phoneImage.topAnchor, leading: phoneImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        
        phone.anchor(top: phoneTitle.bottomAnchor, leading: phoneTitle.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 2, left: 0, bottom: 0, right: 0))
//
//        webImage.anchor(top: phoneImage.bottomAnchor, leading: phoneImage.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: 40, height: 40))
        
//        webTitle.anchor(top: webImage.topAnchor, leading: webImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
//
//        web.anchor(top: webTitle.bottomAnchor, leading: webTitle.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 2, left: 0, bottom: 0, right: 0))
        
        fetchData()
        
    }
    
    func fetchData(){
        let sv = displaySpinner(onView: view)
        NetworkUtils().fetchData(endPoint: "user/me", completion: { (response: BaseResponse<Profile>) in
            self.finishFetchData(response: response,sv: sv)
        }) { (error) in
            self.removeSpinner(spinner: sv)
        }
    }
    
    
    func finishFetchData(response: BaseResponse<Profile>,sv: UIView){
        let profile = response.data
        print(profile)
        
        DispatchQueue.main.async{
            if let image = profile.picture {
                let url = "\(NetworkUtils().BASE_URL_IMAGE)\(image)"
                self.profileImage.loadImageUsingUrlString(urlString: url)
            }
            self.email.text = profile.email
            self.name.text = profile.name
            self.address.text = profile.address
            self.phone.text = profile.phone
            self.web.text = profile.website
            self.company.text = profile.company
        }
        removeSpinner(spinner: sv)
    }
    
    
    
    
    
}
