//
//  RegisterController.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 6/21/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit

class EditProfileController: BaseViewController,UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    let city = ["Select yout city","Bandung", "Jakarta"]
    var cityId = 0
    
    
    
    let pic:UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "user-profile"))
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
    
    let changePicture: UIButton = {
        let button = UIButton()
        
        let normalcolor = UIColor(red: 59.0/250.0, green: 89.0/250, blue: 152.0/250, alpha: 1.0)
        button.backgroundColor = normalcolor
        button.setTitle("Change Picture", for: .normal)
        button.addTarget(self, action: #selector(openImageGallery), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.shadowRadius = 2.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.24
        button.layer.cornerRadius = 2.0
        button.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        return button
    }()
    
    let companyField: TextField = {
        let textField = TextField()
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0).cgColor
        textField.layer.cornerRadius = 2
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
        button.addTarget(self, action: #selector(save), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button    }()
    
    
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
    
    
    let scrollview: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.contentSize.height = 770
        return scrollview
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        setupNavigation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = .white
        
        let profilePic = UIView()
        profilePic.addSubview(pic)
        
        pic.anchor(top: profilePic.topAnchor, leading: profilePic.leadingAnchor, bottom: profilePic.bottomAnchor, trailing: profilePic.trailingAnchor)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
      
        
        view.addSubview(scrollview)
        
        scrollview.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        [
         changePicture,
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
         saveButton,
         profilePic
            ].forEach(scrollview.addSubview(_:))
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        
        cityField.inputView = pickerView
        
        let picSize = 0.3 * view.bounds.width
        
        profilePic.anchor(top: scrollview.topAnchor, leading: nil, bottom: nil, trailing: nil,padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: CGSize(width: picSize, height: picSize))
        
        profilePic.anchorCenter(horizontal: scrollview.centerXAnchor, vertical: nil)
        
        changePicture.anchor(top: profilePic.bottomAnchor, leading: nil, bottom: nil, trailing: nil,padding: .init(top: 8, left: 16, bottom: 0, right: 16),size: .init(width: 150, height: 30))
        
        changePicture.anchorCenter(horizontal: view.centerXAnchor, vertical: nil)
        
        nameLabel.anchor(top: changePicture.bottomAnchor, leading: scrollview.leadingAnchor, bottom: nil, trailing: scrollview.safeAreaLayoutGuide.trailingAnchor,padding: .init(top: 32, left: 16, bottom: 0, right: 16))
        
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
      
        
        saveButton.anchorBottom(to: companyField,padding: .init(top: 32, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 40))
        
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
            self.nameField.text = profile.name
            self.emailField.text = profile.email
            self.addressField.text = profile.address
            self.phoneField.text = profile.phone
            self.companyField.text = profile.company
            self.cityId = profile.agency_id
            if(self.cityId != 0){
             self.cityField.text = self.city[self.cityId]
            }
            if let image = profile.picture {
                let url = "\(NetworkUtils().BASE_URL_IMAGE)\(image)"
                self.pic.loadImageUsingUrlString(urlString: url)
            }
            let currentToken = UserDefaults().getUserData().token
            let user = AuthResponse(id: profile.id, email: profile.email, name: profile.name, token: currentToken)
            UserDefaults().setUserData(user: user)

        }
        removeSpinner(spinner: sv)
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
    
    func savePicture(base64:String){
        performLoading()
        let change = ChangePicture(picture:base64)
        let encoder = JSONEncoder()
        let data = try! encoder.encode(change)
        let json = String(data: data, encoding: .utf8)!
        let encryption = NetworkUtils().encrypt(plainText: json)
        guard let encryptData = "data=\(encryption)".data(using: .utf8) else {return}
        
        NetworkUtils().postData(endPoint: "user/picture", body: encryptData, completion: { (response: RegisterResponse) in
            self.finishSaveImage(response: response)
        }) { (error) in
            self.loadingAlert.dismiss(animated: true, completion: {
                self.performAlert(title: "Error", message: "Opps. Something error")
            })
        }
    }
    
    func finishSaveImage(response: RegisterResponse){
        print("response register",response)
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: {
                self.alert.title = "Success"
                self.alert.message = "Save Success"
                self.present(self.alert, animated: true, completion: nil)
            })
        }
    }
    
    func finishSave(response: BaseResponse<String>){
        print("response register",response)
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: {
                self.alert.title = "Success"
                self.alert.message = "Save Success"
                self.present(self.alert, animated: true, completion: nil)
            })
        }
    }

    
    @objc func save(sender: UIButton){
        if nameField.text == ""
            || emailField.text == ""
            || addressField.text == ""
            || phoneField.text == ""
            || cityField.text == ""
            || companyField.text == ""
        {
            performAlert(title:"Error", message: "Form must not Empty!")
        }else if cityId == 0 {
            performAlert(title:"Error",message: "Please select your city!")
        }
        else {
            performLoading()
            
            let name = nameField.text
            let email = emailField.text
            let address = addressField.text
            let phone = phoneField.text
            let city = cityId
            let company = companyField.text
            let register = Register(name: name!,
                                    email: email!,
                                    address: address!,
                                    phone: phone!,
                                    city: city,
                                    company: company!,
                                    password: "",
                                    agencyId: city)
            
            let encoder = JSONEncoder()
            let data = try! encoder.encode(register)
            let json = String(data: data, encoding: .utf8)!
            print("Request register",json)
            let encryption = NetworkUtils().encrypt(plainText: json)
            guard let encryptData = "data=\(encryption)".data(using: .utf8) else {return}
            
            NetworkUtils().postData(endPoint: "user/update", body: encryptData, completion: { (response: BaseResponse<Array<String>>) in
                self.finishSave(response: response)
            }) { (error) in
                self.loadingAlert.dismiss(animated: true, completion: {
                    self.performAlert(title: "Error", message: "Opps. Something error")
                })
            }
            
        }
        
    }
    
    @objc func openImageGallery() {
        
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType =  UIImagePickerControllerSourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.dismiss(animated: true, completion: {
            let image_data = info[UIImagePickerControllerOriginalImage] as? UIImage
            if let image = image_data {
                self.processPicture(image: image)
            }
        })
    }
    
    func processPicture(image:UIImage){
        let new = image.resizedImage(newSize: CGSize(width: 100, height: 100))
        let data = new.jpeg(.lowest)
        let base64 = data?.base64EncodedString()
        self.savePicture(base64: base64!)
        
    }
    
    func finishSave(response: BaseResponse<Array<String>>){
        print("response register",response)
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: {
                self.alert.title = "Success"
                self.alert.message = "Save Success"
                self.present(self.alert, animated: true, completion: nil)
            })
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        self.scrollview.contentSize.height = 770
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

