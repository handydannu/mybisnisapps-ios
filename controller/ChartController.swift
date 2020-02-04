//
//  ChartController.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 7/13/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit

class ChartProductCell: UICollectionViewCell {
    
    var chartItem:Chart? {
        didSet{
            guard let unwrapChart = chartItem else {return}
            
            title.text = unwrapChart.product_name.uppercased()
            keterangan.text = unwrapChart.description
            switch unwrapChart.product_id {
            case 11:
                menu.image = #imageLiteral(resourceName: "icon_tv")
            case 10:
                menu.image = #imageLiteral(resourceName: "icon_buku")
            case 12:
                menu.image = #imageLiteral(resourceName: "icon_corporate_brand")
            case 13:
                menu.image = #imageLiteral(resourceName: "icon_eo")
            case 14:
                menu.image = #imageLiteral(resourceName: "icon_epapers")
            case 17:
                menu.image = #imageLiteral(resourceName: "icon_percetakan")
            case 18:
                menu.image = #imageLiteral(resourceName: "icon_riset")
            case 19:
                menu.image = #imageLiteral(resourceName: "icon_bi_weekend")
            case 20:
                menu.image = #imageLiteral(resourceName: "icon_iklan_devider")
            case 21:
                menu.image = #imageLiteral(resourceName: "icon_diskon_penjualan")
            case 26:
                menu.image = #imageLiteral(resourceName: "icon_iklan_klasifikasi")
            case 22:
                menu.image = #imageLiteral(resourceName: "icon_iklan_paket")
            case 23:
                menu.image = #imageLiteral(resourceName: "icon_iklan_spesifikasi")
            case 25:
                menu.image = #imageLiteral(resourceName: "icon_iklan_jaket")
            case 24:
                menu.image = #imageLiteral(resourceName: "icon_iklan_umum")
            case 27:
                menu.image = #imageLiteral(resourceName: "icon_permintaan_khusus")
            case 28:
                menu.image = #imageLiteral(resourceName: "icon_media_sosial")
            case 31:
                menu.image = #imageLiteral(resourceName: "icon_media_sosial")
            case 29:
                menu.image = #imageLiteral(resourceName: "icon_media_sosial")
            case 30:
                menu.image = #imageLiteral(resourceName: "icon_media_sosial")
            case 32:
                menu.image = #imageLiteral(resourceName: "icon_it_solution")
            case 33:
                menu.image = #imageLiteral(resourceName: "icon_it_solution")
            case 34:
                menu.image = #imageLiteral(resourceName: "icon_it_solution")
            case 9:
                menu.image = #imageLiteral(resourceName: "icon_video")
            case 41:
                menu.image = #imageLiteral(resourceName: "icon_iklan_khusus")
            default:
                print("ga tau")
            }
        }
    }
    
    private let menu: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "icon_video")
        return image
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.text = "Video"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        return label
    }()
    
    private let keterangan: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Tidak ada keterangan"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor(red: 20/255, green: 82/255, blue: 147/255, alpha: 1)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let hapusBtn: UIButton = {
        let button = UIButton()
        
        let normalcolor = UIColor(red: 237.0/250.0, green: 41/250, blue: 57/250, alpha: 1.0)
        let higlightcolor = UIColor(red: 180/250.0, green: 41/250, blue: 57/250, alpha: 1.0)
        button.backgroundColor = normalcolor
        button.setTitle("Hapus", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.shadowRadius = 2.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.24
        button.layer.cornerRadius = 2.0
        button.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        return button
    }()
    
    let divider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        keterangan.sizeToFit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(menu)
        addSubview(title)
        addSubview(divider)
        addSubview(keterangan)
        addSubview(hapusBtn)
        
        let gridCount = CGFloat(3)
        let widthEachItem = (frame.size.width / gridCount) - 24 - 8
        
        menu.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 16, left: 16, bottom: 8, right: 8),size: .init(width: widthEachItem, height: widthEachItem))
        
        title.anchor(top: menu.topAnchor, leading: menu.trailingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 8, left: 16, bottom: 0, right: 8))
        
        keterangan.anchor(top: title.bottomAnchor, leading: title.leadingAnchor, bottom: menu.bottomAnchor, trailing: trailingAnchor,padding: .init(top: 4, left: 0, bottom: 0, right: 0))
        
        hapusBtn.anchor(top: menu.bottomAnchor, leading: menu.leadingAnchor, bottom: nil, trailing: menu.trailingAnchor,padding:.init(top: 8, left: 0, bottom: 0, right: 0),size:.init(width: 0, height: 25))
        
        divider.anchor(top: nil, leading:leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 8, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 1))
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}
class ChartHeaderCell : UICollectionViewCell {
    
    let headerImage:UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "header_bg_produk"))
        return image
    }()
    
    let judul:UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "my_chart"))
        return image
    }()
    
    func setupHeader(){
        
        addSubview(headerImage)
        let headerImageSize = headerImage.image?.aspectRatio(multiplier: 1,of: self)
        headerImage.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,size:headerImageSize!)
        
        headerImage.addSubview(judul)
        let judulSize = judul.image?.aspectRatio(multiplier: 0.30,of: headerImage)
        judul.anchor(top: headerImage.topAnchor, leading: headerImage.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: ((headerImageSize?.height)! - (judulSize?.height)!) * 0.5, left: 16, bottom: 0, right: 0), size: judulSize!)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHeader()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

class ChartController : UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(handleRefresh),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor(red: 59.0/250.0, green: 89.0/250, blue: 152.0/250, alpha: 1.0)
        
        return refreshControl
    }()
    
    let alert = UIAlertController(title: "Success", message: "Success order product", preferredStyle: UIAlertControllerStyle.alert)
    
    
    var charts:Array<Chart> = []
    
    override func viewWillDisappear(_ animated: Bool) {
        setupNavigation()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.addSubview(refreshControl)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        fetchData()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(ChartProductCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.register(ChartHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId")
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return charts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ChartProductCell
        let chart = charts[indexPath.item]
        cell.chartItem = chart
        cell.hapusBtn.tag = indexPath.item
        cell.hapusBtn.addTarget(self, action: #selector(hapusItem(sender:)), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthEachItem = ((collectionView.bounds.width / 3) - 16 - 8) + 34 + 25

        return CGSize(width: collectionView.bounds.width, height: widthEachItem )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
            return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId", for: indexPath)
            
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 70)
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
        NetworkUtils().fetchData(endPoint: "product/my_order", completion: { (response: BaseResponse<[Chart]>) in
            self.finishFetchData(response: response,sv: sv)
        }) { (error) in
            self.removeSpinner(spinner: sv)
        }
    }
    
    func finishFetchData(response: BaseResponse<[Chart]>,sv: UIView){
        let listChart = response.data
        
        DispatchQueue.main.async{
            self.charts = listChart
            self.collectionView?.reloadData()
        }
        removeSpinner(spinner: sv)
    }
    
    @objc func hapusItem(sender: UIButton){
        let indexPath = IndexPath(item: sender.tag, section: 0)
        let chart = charts[indexPath.item]
        let orderId = chart.order_id
        let questionController = UIAlertController(title: "Delete Chart?", message: nil, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        let deleteAction = UIAlertAction(title: "Delete", style: .default) { (_) in
            self.charts.remove(at: indexPath.item)
            self.collectionView?.deleteItems(at: [indexPath])
            
            self.doDelete(orderId: orderId)
            
        }
        questionController.addAction(cancelAction)
        questionController.addAction(deleteAction)
        self.present(questionController, animated: true, completion: nil)
    }
    
    func doDelete(orderId: Int){
        let delete = DeleteOrder(order_id: orderId)
        let encoder = JSONEncoder()
        let data = try! encoder.encode(delete)
        let json = String(data: data, encoding: .utf8)!
        let encryption = NetworkUtils().encrypt(plainText: json)
        guard let encryptData = "data=\(encryption)".data(using: .utf8) else {return}
        
        
        NetworkUtils().postData(endPoint: "product/ordered/delete", body: encryptData, completion: { (response: MinimumResponse) in
            print("Response",response)
        }) { (error) in
            print("Error",error)
        }
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }
    
    @objc func handleRefresh() {
        fetchData()
        refreshControl.endRefreshing()
    }
    
}
