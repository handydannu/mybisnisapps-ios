//
//  RegisterController.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 6/21/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit

class ChangePasswordController: BaseViewController {
    
    let passwordLabel : UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let passwordField: TextField = {
        let textField = TextField()
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0).cgColor
        textField.layer.cornerRadius = 2
        return textField
    }()
    
    let repasswordLabel : UILabel = {
        let label = UILabel()
        label.text = "Retype Password"
        label.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let repasswordField: TextField = {
        let textField = TextField()
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0).cgColor
        textField.layer.cornerRadius = 2
        textField.returnKeyType = .done
        textField.tag = 6
        return textField
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        button.setTitle("Save", for: .normal)
        button.layer.shadowRadius = 2.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.24
        button.layer.cornerRadius = 2.0
        button.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        button.addTarget(self, action: #selector(doRegister), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button    }()
    
    let scrollview: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.contentSize.height = 400
        return scrollview
    }()
    
    
    let alert = UIAlertController(title: "Error", message: "Form must not Empty!", preferredStyle: UIAlertControllerStyle.alert)
    
    let loadingAlert: UIAlertController = {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        return alert
    }()
    
    let loadingIndicator :UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        return indicator
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = .white
        
        view.addSubview(scrollview)
        
        scrollview.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        [
         passwordLabel,
         passwordField,
         repasswordLabel,
         repasswordField,
         saveButton
            ].forEach(scrollview.addSubview(_:))
        
        passwordLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: scrollview.leadingAnchor, bottom: nil, trailing: scrollview.safeAreaLayoutGuide.trailingAnchor,padding: .init(top: 32, left: 16, bottom: 0, right: 16))
        
        passwordField.anchorBottom(to: passwordLabel,padding: .init(top: 8, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 40))
        
        repasswordLabel.anchorBottom(to: passwordField,padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        repasswordField.anchorBottom(to: repasswordLabel,padding: .init(top: 8, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 40))
        
        saveButton.anchorBottom(to: repasswordField,padding: .init(top: 32, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 40))
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    }
    
    
    func performAlert(title: String,message: String){
        alert.title = title
        alert.message = message
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func performLoading(){
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        loadingIndicator.startAnimating();
        
        loadingAlert.view.addSubview(loadingIndicator)
        present(loadingAlert, animated: true, completion: nil)
    }
    
    
    @objc func doRegister(sender: UIButton){
        if   passwordField.text == ""
            || repasswordField.text == ""
        {
            performAlert(title:"Error", message: "Form must not Empty!")
        }
        else if passwordField.text != repasswordField.text {
            performAlert(title:"Error",message: "Password not match!")
        }
        else {
            performLoading()
            
            let password = passwordField.text
            let repassword = repasswordField.text
            let changed = ChangePassword(password:password!,retypePassword: repassword!)

            let encoder = JSONEncoder()
            let data = try! encoder.encode(changed)
            let json = String(data: data, encoding: .utf8)!
            print("Request register",json)
            let encryption = NetworkUtils().encrypt(plainText: json)
            guard let encryptData = "data=\(encryption)".data(using: .utf8) else {return}

            NetworkUtils().postData(endPoint: "user/password", body: encryptData, completion: { (response: RegisterResponse) in
                self.finishLogin(response: response)
            }) { (error) in
                self.loadingAlert.dismiss(animated: true, completion: nil)
            }

        }
    }
    
    func resetForm(){
        passwordField.text = ""
        repasswordField.text = ""
    }
    
    
    func finishLogin(response: RegisterResponse){
        print("response register",response)
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: {
                self.alert.title = "Success"
                self.alert.message = "Password Changed"
                self.present(self.alert, animated: true, completion: {
                    self.resetForm()
                })
            })
        }
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        self.scrollview.contentSize.height = 400
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.scrollview.contentSize.height += keyboardSize.height
                print("Keyboard Show", self.scrollview.contentSize.height)
                
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.scrollview.contentSize.height -= keyboardSize.height
                print("Keyboard Hide", self.scrollview.contentSize.height)
            }
        }
    }
}
