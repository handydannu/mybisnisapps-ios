//
//  SolusiMediaTerpaduController.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 7/11/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit

class BaseHtmlViewController: BaseViewController{
    
    var keterangan: String  = ""
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(handleRefresh),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor(red: 59.0/250.0, green: 89.0/250, blue: 152.0/250, alpha: 1.0)
        
        return refreshControl
    }()
    
    var id = "0"
    
    let content : UITextView = {
        let label = UITextView()
        label.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.isEditable = false

        return label
    }()
    
    let divider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        return view
    }()
    
    let chart: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "keranjang"), for: .normal)
        button.addTarget(self, action: #selector(order), for: .touchUpInside)
        return button
    }()
    
    let alert = UIAlertController(title: "Success", message: "Success order product", preferredStyle: UIAlertControllerStyle.alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        
        content.addSubview(refreshControl)
        
        if(id != "15"){
            view.addSubview(content)
            view.addSubview(divider)
            view.addSubview(chart)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            chart.anchor(top: nil, leading: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 16, right: 16), size: .init(width: 24, height: 24))
            
            divider.anchor(top: nil, leading: view.leadingAnchor, bottom: chart.topAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 8, bottom: 8, right: 8), size: .init(width: 0, height: 1))
            
            
            
            content.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: divider.topAnchor, trailing: view.trailingAnchor, padding: .init(top: 8.0, left: 8.0, bottom: 8, right: 8.0))
            
        }else {
            view.addSubview(content)
            content.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 8.0, left: 8.0, bottom: 8, right: 8.0))
        }
        
        fetchData()

    }
    
    
    func fetchData(){
        let sv = displaySpinner(onView: view)
        NetworkUtils().fetchData(endPoint: "product/\(id)", completion: { (response: BaseResponse<String>) in
            self.finishFetchData(response: response,sv: sv)
        }) { (error) in
            self.removeSpinner(spinner: sv)
        }
    }
    
    func finishFetchData(response: BaseResponse<String>,sv: UIView){
        let html = response.data
        DispatchQueue.main.async {
            self.content.attributedText = html.htmlAttributed(family: nil, size: 12, color: UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1))
        }
        removeSpinner(spinner: sv)
        
    }
    
    @objc func order(){
        showInputDialog()
    }
    
    @objc func handleRefresh() {
        fetchData()
        refreshControl.endRefreshing()
    }
    
    func showInputDialog() {
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
            
            
            NetworkUtils().postData(endPoint: "product/\(self.id)/order", body: encryptData, completion: { (response: MinimumResponse) in
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
