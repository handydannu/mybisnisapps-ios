//
//  VideoContentController.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 7/12/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit

class VideoProductCell: UICollectionViewCell {
    
    var videoItem:Video? {
        didSet{
            guard let unwrapVideo = videoItem else {return}
            video.loadImageUsingUrlString(urlString: unwrapVideo.thumbnail_url)
        }
    }
    
    private let video: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(video)
        video.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 8, left: 8, bottom: 8, right: 8))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class videFooterCell : UICollectionViewCell {
    
    
    let divider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        return view
    }()
    
    let chart: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(#imageLiteral(resourceName: "keranjang"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(divider)
        addSubview(chart)
        
        chart.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 16, right: 16), size: .init(width: 24, height: 24))
        
        divider.anchor(top: nil, leading: leadingAnchor, bottom: chart.topAnchor, trailing: trailingAnchor,padding: .init(top: 0, left: 8, bottom: 8, right: 8), size: .init(width: 0, height: 1))
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class VideoContentController : UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    
    var keterangan: String  = ""

    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(handleRefresh),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor(red: 59.0/250.0, green: 89.0/250, blue: 152.0/250, alpha: 1.0)
        
        return refreshControl
    }()
    
    var id: String = "0"
    var judul:String = "judul_produk"
    
    let alert = UIAlertController(title: "Success", message: "Success order product", preferredStyle: UIAlertControllerStyle.alert)
    
    
    var videos:Array<Video> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        fetchData()
        
        collectionView?.addSubview(refreshControl)
        
        collectionView?.backgroundColor = .white
        
        collectionView?.register(VideoProductCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.register(ProductHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId")
        collectionView?.register(videFooterCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footerId")
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoProductCell
        cell.videoItem = videos[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height: 250 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId", for: indexPath) as! ProductHeaderCell
            headerCell.judulString = self.judul
            return headerCell
        }
        else {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footerId", for: indexPath) as! videFooterCell
            footerView.chart.addTarget(self, action: #selector(order), for: .touchUpInside)

            return footerView
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let video = videos[indexPath.item]
        let url = URL(string: video.video_url)
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    func setupNavigation(){
        let labelTitle = UILabel()
        let user = UserDefaults().getUserData()
        labelTitle.text = "Hello \(user.name)!"
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
    
    func fetchData(){
        let sv = displaySpinner(onView: view)
        NetworkUtils().fetchData(endPoint: "product/\(id)", completion: { (response: BaseResponse<String>) in
            self.finishFetchData(response: response,sv: sv)
        }) { (error) in
            self.removeSpinner(spinner: sv)
        }
    }
    
    func finishFetchData(response: BaseResponse<String>,sv: UIView){
        let listVideo = response.data
        
        do {
            guard let data = listVideo.data(using: .utf8) else {return}
            let obj = try JSONDecoder().decode([Video].self, from:data)
            
            DispatchQueue.main.async{
                self.videos.append(contentsOf: obj)
                self.collectionView?.reloadData()
            }

        }catch let jsonError{
            print("Failed to decode json :",jsonError)
        }
        
        removeSpinner(spinner: sv)
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
