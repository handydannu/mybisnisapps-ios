//
//  RegisterController.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 6/21/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit

class RegisterController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    
       let city = ["Select yout city","Bandung", "Jakarta"]
       var cityId = 0
    
    let logo:UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "home_logo"))
        return image
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Your Name"
        label.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        
        return label
    }()
    
    let nameField: TextField = {
        let textField = TextField()
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0).cgColor
        textField.layer.cornerRadius = 2
        return textField
    }()
    
    let emailLabel : UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let emailField: TextField = {
        let textField = TextField()
        textField.keyboardType = .emailAddress
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0).cgColor
        textField.layer.cornerRadius = 2
        textField.autocapitalizationType = .none
        return textField
    }()
    
    let addressLabel : UILabel = {
        let label = UILabel()
        label.text = "Address"
        label.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let addressField: TextField = {
        let textField = TextField()
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0).cgColor
        textField.layer.cornerRadius = 2
        return textField
    }()
    
    let phoneLabel : UILabel = {
        let label = UILabel()
        label.text = "Phone"
        label.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let phoneField: TextField = {
        let textField = TextField()
        textField.keyboardType = .phonePad
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0).cgColor
        textField.layer.cornerRadius = 2
        return textField
    }()
    
    let cityLabel : UILabel = {
        let label = UILabel()
        label.text = "City"
        label.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let cityField: TextField = {
        let textField = TextField()
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0).cgColor
        textField.layer.cornerRadius = 2
        return textField
    }()
    
    let companyLabel : UILabel = {
        let label = UILabel()
        label.text = "Company"
        label.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let companyField: TextField = {
        let textField = TextField()
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0).cgColor
        textField.layer.cornerRadius = 2
        textField.tag = 4
        return textField
    }()
    
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
    
    let signupButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        button.setTitle("Sign Up", for: .normal)
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
        scrollview.contentSize.height = 900
        return scrollview
    }()
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return city.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return city[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if( row != 0){
            cityField.text = city[row]
            cityId = row
        }
    }
    
    
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = .white
        
        view.addSubview(scrollview)
        
        scrollview.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)

        [logo,
         nameLabel,
         nameField,
         emailLabel,
         emailField,
         addressLabel,
         addressField,
         phoneLabel,
         phoneField,
         cityLabel,
         cityField,
         companyField,
         companyLabel,
         passwordLabel,
         passwordField,
         repasswordLabel,
         repasswordField,
         signupButton
            ].forEach(scrollview.addSubview(_:))
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        cityField.inputView = pickerView

        let width = 0.5 * view.bounds.width
        let height = CGFloat(width) * ((logo.image?.size.height)! / (logo.image?.size.width)!)

        logo.anchor(top: scrollview.topAnchor, leading: nil, bottom: nil, trailing: scrollview.safeAreaLayoutGuide.trailingAnchor, padding: UIEdgeInsetsMake(16, 0, 0, 16), size: CGSize(width: width, height: height))

        nameLabel.anchor(top: logo.bottomAnchor, leading: scrollview.leadingAnchor, bottom: nil, trailing: scrollview.safeAreaLayoutGuide.trailingAnchor,padding: .init(top: 32, left: 16, bottom: 0, right: 16))

        nameField.anchorBottom(to: nameLabel,padding: .init(top: 8, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 40))

        emailLabel.anchorBottom(to: nameField,padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        emailField.anchorBottom(to: emailLabel,padding: .init(top: 8, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 40))

        addressLabel.anchorBottom(to: emailField,padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        addressField.anchorBottom(to: addressLabel,padding: .init(top: 8, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 40))

        phoneLabel.anchorBottom(to: addressField,padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        phoneField.anchorBottom(to: phoneLabel,padding: .init(top: 8, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 40))

        cityLabel.anchorBottom(to: phoneField,padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        cityField.anchorBottom(to: cityLabel,padding: .init(top: 8, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 40))

        companyLabel.anchorBottom(to: cityField,padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        companyField.anchorBottom(to: companyLabel,padding: .init(top: 8, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 40))

        passwordLabel.anchorBottom(to: companyField,padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        passwordField.anchorBottom(to: passwordLabel,padding: .init(top: 8, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 40))

        repasswordLabel.anchorBottom(to: passwordField,padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        repasswordField.anchorBottom(to: repasswordLabel,padding: .init(top: 8, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 40))
        
        signupButton.anchorBottom(to: repasswordField,padding: .init(top: 32, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 40))
        
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
        if nameField.text == ""
            || emailField.text == ""
            || addressField.text == ""
            || phoneField.text == ""
            || cityField.text == ""
            || companyField.text == ""
            || passwordField.text == ""
            || repasswordField.text == ""
        {
            performAlert(title:"Error", message: "Form must not Empty!")
        }else if cityId == 0 {
            performAlert(title:"Error",message: "Please select your city!")
        }
        else if passwordField.text != repasswordField.text {
            performAlert(title:"Error",message: "Password not match!")
        }
        else {
            performLoading()
            
            let name = nameField.text
            let email = emailField.text
            let address = addressField.text
            let phone = phoneField.text
            let city = cityId
            let company = companyField.text
            let password = passwordField.text
            let register = Register(name: name!,
                email: email!,
                address: address!,
                phone: phone!,
                city: city,
                company: company!,
                password: password!,
                agencyId: city)
            
            let encoder = JSONEncoder()
            let data = try! encoder.encode(register)
            let json = String(data: data, encoding: .utf8)!
            print("Request register",json)
            let encryption = NetworkUtils().encrypt(plainText: json)
            guard let encryptData = "data=\(encryption)".data(using: .utf8) else {return}
            
            NetworkUtils().postData(endPoint: "auth/register", body: encryptData, completion: { (response: RegisterResponse) in
                self.finishLogin(response: response)
            }) { (error) in
                self.loadingAlert.dismiss(animated: true, completion: nil)
            }
            
        }
    }
    
    func resetForm(){
        nameField.text = ""
        emailField.text = ""
        addressField.text = ""
        phoneField.text = ""
        cityId = 0
        companyField.text = ""
        passwordField.text = ""
        repasswordField.text = ""
    }
    
    
    func finishLogin(response: RegisterResponse){
        print("response register",response)
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: {
                self.alert.title = "Success"
                self.alert.message = "Register Success, Please login"
                self.present(self.alert, animated: true, completion: {
                    self.resetForm()
            })
        })
    }
}

    
    @objc func keyboardWillShow(notification: NSNotification) {
        self.scrollview.contentSize.height = 900
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

class TextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8);
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    

}
