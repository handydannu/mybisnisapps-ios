//
//  LoginController.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 6/12/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {
    
    var passwordVisibility: Bool = true
    
    let background: UIImageView = {
       let image = UIImageView(image: #imageLiteral(resourceName: "background_login"))
        return image
    }()
    
    let logo: UIImageView = {
       let image = UIImageView(image: #imageLiteral(resourceName: "logo_login"))
        return image
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = .white
        return label
    }()
    
    let fieldEmail: TextField = {
       let textField = TextField()
        textField.keyboardType = .emailAddress
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.autocapitalizationType = .none
        textField.returnKeyType = .next;
        textField.tag = 0
        return textField
    }()
    
    let passwordLabel : UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .white
        return label
    }()
    
    let fieldPassword: TextField = {
        let textField = TextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.returnKeyType = .done;
        textField.tag = 1
        return textField
    }()
    
    let showLabel: UILabel = {
        let label = UILabel()
        label.text = "SHOW"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = UIColor(red: 80/255, green: 80/255, blue: 80/255, alpha: 1)
        return label
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 52.0/250.0, green: 168.0/250, blue: 83.0/250, alpha: 1.0)
        button.addTarget(self, action: #selector(doLogin(sender:)), for: .touchUpInside)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.shadowRadius = 2.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.24
        button.layer.cornerRadius = 2.0
        button.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        return button    }()
    
    let alert = UIAlertController(title: "Error", message: "Form must not Empty!", preferredStyle: UIAlertControllerStyle.alert)
    
    let loadingAlert: UIAlertController = {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        return alert
    }()
    
    let loadingIndicator :UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        return indicator
    }()
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
    
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        fieldEmail.delegate = self
        fieldPassword.delegate = self
        
        let passwordWrapper = UIView()
        passwordWrapper.layer.cornerRadius = 5
        passwordWrapper.backgroundColor = .white
    
        passwordWrapper.addSubview(fieldPassword)
        passwordWrapper.addSubview(showLabel)
        
        showLabel.anchor(top: nil, leading: nil, bottom: nil, trailing: passwordWrapper.trailingAnchor,size: .init(width: 50, height: 0))
        showLabel.anchorCenter(horizontal: nil, vertical: passwordWrapper.centerYAnchor)
        
        fieldPassword.anchor(top: passwordWrapper.topAnchor, leading: passwordWrapper.leadingAnchor, bottom: passwordWrapper.bottomAnchor, trailing: showLabel.leadingAnchor)
        
        [background,
         logo,
         emailLabel,
         fieldEmail,
         passwordLabel,
         loginButton,
         passwordWrapper
        ].forEach(view.addSubview(_:))
        
        background.anchorSuperview()
        
        let width = 0.5 * view.bounds.width
        let height = CGFloat(width) * ((logo.image?.size.height)! / (logo.image?.size.width)!)
        
        logo.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: UIEdgeInsetsMake(16, 0, 0, 16), size: CGSize(width: width, height: height))
        
        emailLabel.anchor(top: logo.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor,padding: .init(top: 64, left: 16, bottom: 0, right: 16))
        
        fieldEmail.anchor(top: emailLabel.bottomAnchor, leading: emailLabel.leadingAnchor, bottom: nil, trailing: emailLabel.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0),
                          size: .init(width: 0, height: 34))
        
        passwordLabel.anchor(top: fieldEmail.bottomAnchor, leading: emailLabel.leadingAnchor, bottom: nil, trailing: emailLabel.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        
        passwordWrapper.anchor(top: passwordLabel.bottomAnchor, leading: passwordLabel.leadingAnchor, bottom: nil, trailing: passwordLabel.trailingAnchor,padding: .init(top: 16, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 34))
        
        loginButton.anchor(top: passwordWrapper.bottomAnchor, leading: passwordWrapper.leadingAnchor, bottom: nil, trailing: passwordWrapper.trailingAnchor,padding: .init(top: 32, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 40))
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        showLabel.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(changePasswordVisibility))
        showLabel.addGestureRecognizer(gesture)
        
    }
    
    func setupNavigation(){
        
        let logo = UIImageView(image: #imageLiteral(resourceName: "home_logo"))
        
        logo.frame = CGRect(x: 0, y: 0, width: 100, height: 10)
        navigationController?.navigationItem.setRightBarButton(UIBarButtonItem(customView: logo), animated: true)
    }
    
    @IBAction func doLogin(sender: UIButton){
        if fieldEmail.text == "" || fieldPassword.text == "" {
            performAlert()
        }
        else {
            performLoading()
            let email = fieldEmail.text
            let password = fieldPassword.text
            let auth = AuthBisnis(email: email!, password: password!)
            
            let encoder = JSONEncoder()
            let data = try! encoder.encode(auth)
            let json = String(data: data, encoding: .utf8)!
            let encryption = NetworkUtils().encrypt(plainText: json)
            guard let encryptData = "data=\(encryption)".data(using: .utf8) else {return}
            
            NetworkUtils().postData(endPoint: "auth/login", body: encryptData, completion: { (response: BaseResponse<AuthResponse>) in
                    self.finishLogin(user: response.data)
            }) { (error) in
                self.loadingAlert.dismiss(animated: true, completion: {
                    self.alert.title = "Error"
                    self.alert.message = "Can't Login password not match"
                    self.present(self.alert, animated: true, completion: nil)
                })
            }
        
        }
    }
    
    func performAlert(){
        self.present(alert, animated: true, completion: nil)
    }
    
    func finishLogin(user:AuthResponse){
        UserDefaults().setLoggedIn(to: true)
        UserDefaults().setUserData(user: user)
        UserDefaults().setLoginType(type:"default")
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: {
                self.present(CustomTabBarController(), animated: true, completion: nil)
            })
        }
      
    }    
    
    func performLoading(){
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        loadingIndicator.startAnimating();
        
        loadingAlert.view.addSubview(loadingIndicator)
        present(loadingAlert, animated: true, completion: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        self.view.frame.origin.y = 0
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height * 0.5
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0

        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                print("keyboard hide")
                self.view.frame.origin.y += keyboardSize.height * 0.5
            }
        }
    }
    
    @objc func changePasswordVisibility(){
        passwordVisibility = !passwordVisibility
        fieldPassword.isSecureTextEntry = passwordVisibility ? true: false
        showLabel.text = passwordVisibility ? "SHOW":"HIDE"
    }
    
    
    
}
