//
//  LainnyaController.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 7/13/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LainnyaController: BaseViewController {
    
    let EditProfile: UILabel = {
        let label = UILabel()
        label.text = "Edit Profile"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        return label
    }()
    
    let changePassword: UILabel = {
        let label = UILabel()
        label.text = "Change Password"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        return label
    }()
    
    let appVersion: UILabel = {
        let label = UILabel()
        label.text = "App Version"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        return label
    }()
    
    let version: UILabel = {
        let label = UILabel()
        let nsObject: AnyObject? = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as AnyObject
        let version = nsObject as! String
        label.text = version
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        return label
    }()
    
    let divider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        return view
    }()
    
    let divider2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        return view
    }()
    
    let divider3: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        return view
    }()

    
    let logoutView :UIView = {
       let view = UIView()
        let logout: UILabel = {
            let label = UILabel()
            label.text = "Logout"
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 15)
            label.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
            return label
        }()
        
        view.addSubview(logout)
        
       logout.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 16, left: 16, bottom: 0, right: 0))
        return view
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        setupNavigation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [EditProfile ,appVersion,version,divider,divider2,changePassword,divider3, logoutView].forEach(view.addSubview(_:))
        
        EditProfile.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 0, left: 16, bottom: 0, right: 16),size: .init(width: 0, height: 50))
        
        divider2.anchor(top: EditProfile.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 1))
        
        changePassword.anchor(top: divider2.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 0, left: 16, bottom: 0, right: 16),size: .init(width: 0, height: 50))
        
        divider3.anchor(top: changePassword.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 1))
        
        
        appVersion.anchor(top: divider3.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 16, left: 16, bottom: 0, right: 0))
        
        version.anchor(top: appVersion.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 16))
        
        divider.anchor(top: appVersion.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 16, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 1))
        
        logoutView.anchor(top: divider.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 64))
        
        logoutView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(logoutAction))
        logoutView.addGestureRecognizer(gesture)
        
        EditProfile.isUserInteractionEnabled = true
        let editGesture = UITapGestureRecognizer(target: self, action:  #selector(editProfile))
        EditProfile.addGestureRecognizer(editGesture)
        
        changePassword.isUserInteractionEnabled = true
        let passGesture = UITapGestureRecognizer(target: self, action:  #selector(ubahPass))
        changePassword.addGestureRecognizer(passGesture)
    }
    
    @objc func logoutAction(){
        print("logoutTap")
        let type = UserDefaults().getLogginType()
        if(type == "google"){
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
        }
        UserDefaults().setLoggedIn(to: false)
//        UINavigationController(rootViewController: unautorizeController)
        self.present(        UINavigationController(rootViewController: UnautorizeController())
, animated: true, completion: nil)
    }
    
    @objc func ubahPass(){
        self.navigationController?.pushViewController(ChangePasswordController(), animated: true)
    }
    
    @objc func editProfile(){
        self.navigationController?.pushViewController(EditProfileController(), animated: true)
    }
    
    
}
