//
//  UnautorizeController.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 6/11/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKLoginKit

class UnautorizeController: UIViewController, GIDSignInUIDelegate, FBSDKLoginButtonDelegate {
  
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("logout")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("login")
    }
    
    let logo:UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "home_logo"))
        return image
    }()
    
    let partnerView:UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "partner"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    let gLoginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setImage(#imageLiteral(resourceName: "google"), for: .normal)
        button.contentHorizontalAlignment = .left
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 0)
        button.setTitle("Sign in with google", for: .normal)
        button.setTitleColor(UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.8), for: .normal)
        button.layer.shadowRadius = 2.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.24
        button.layer.cornerRadius = 2.0
        button.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(gLogin), for: .touchUpInside)
        return button
    }()
    
    let fLoginButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 59.0/250.0, green: 89.0/250, blue: 152.0/250, alpha: 1.0)
        button.setImage(#imageLiteral(resourceName: "ic_facebook"), for: .normal)
        button.contentHorizontalAlignment = .left
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 0)
        button.setTitle("Sign in with facebook", for: .normal)
        button.layer.shadowRadius = 2.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.24
        button.layer.cornerRadius = 2.0
        button.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(fLogin), for: .touchUpInside)

        return button
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 52.0/250.0, green: 168.0/250, blue: 83.0/250, alpha: 1.0)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.shadowRadius = 2.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.24
        button.layer.cornerRadius = 2.0
        button.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        button.addTarget(self, action: #selector(doLogin), for: .touchUpInside)
        return button
        
    }()
    
    let signupButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 59.0/250.0, green: 89.0/250, blue: 152.0/250, alpha: 1.0)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.shadowRadius = 2.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.24
        button.layer.cornerRadius = 2.0
        button.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        button.addTarget(self, action: #selector(doRegister), for: .touchUpInside)
        return button
        
    }()
    
    let orLabel: UILabel = {
        let label = UILabel()
        label.text = "or"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        [logo,
         partnerView,
         gLoginButton,
         fLoginButton,
         loginButton,
         orLabel,
         signupButton
            ].forEach( view.addSubview(_:))
        
        
        let width = 0.5 * view.bounds.width
        let height = CGFloat(width) * ((logo.image?.size.height)! / (logo.image?.size.width)!)
        
        logo.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: UIEdgeInsetsMake(16, 0, 0, 16), size: CGSize(width: width, height: height))
        
        partnerView.anchor(top: nil, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
        
         loginButton.anchor(top: nil, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: partnerView.topAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor,padding:.init(top: 0, left: 16, bottom: 32, right: 16),size: .init(width: 0, height: 40))
        
        fLoginButton.anchor(top: nil, leading: loginButton.leadingAnchor, bottom: loginButton.topAnchor, trailing: loginButton.trailingAnchor,padding:.init(top: 0, left: 0, bottom: 16, right: 0),size: .init(width: 0, height: 40))
        
        gLoginButton.anchor(top: nil, leading: fLoginButton.leadingAnchor, bottom:fLoginButton.topAnchor, trailing: fLoginButton.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 16, right: 0), size: .init(width: 0, height: 40))
        
        orLabel.anchor(top: nil, leading: view.leadingAnchor, bottom: gLoginButton.topAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 16, right: 0))
        
        signupButton.anchor(top: nil, leading: loginButton.leadingAnchor, bottom: orLabel.topAnchor, trailing: loginButton.trailingAnchor,padding:.init(top: 0, left: 0, bottom: 16, right: 0),size: .init(width: 0, height: 40))
        
    }
    
    @objc func gLogin() {
        GIDSignIn.sharedInstance().signIn()
    }
    
    @objc func fLogin() {
        let login = FBSDKLoginManager.init()
        login.logIn(withReadPermissions: ["public_profile"], from: self, handler: { (result, error) -> Void in
            
            if (error == nil){
                var fbloginresult : FBSDKLoginManagerLoginResult = result!
            
            if(fbloginresult.isCancelled) {
            //Show Cancel alert
            } else if(fbloginresult.grantedPermissions.contains("email")) {
            self.returnUserData()
            //fbLoginManager.logOut()
            }
            }
            })
    
    }
    
    func returnUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    print(result)
                }
            })
        }
    }
    
    @objc func doLogin(){
        self.navigationController?.pushViewController(LoginController(), animated: true)
            }
    
    @objc func doRegister(){
        self.navigationController?.pushViewController(RegisterController(), animated: true)
    }
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        print("present")
    }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        
        print("hoho")
        if let error = error {
            print("Google Sign in error",error)
            return
        }
        
        print("Google Sign in", user)
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        // ...
        
        print(user.profile.givenName)
    }
    
    
        
}
