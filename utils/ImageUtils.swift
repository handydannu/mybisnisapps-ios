//
//  SizeUtils.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 6/14/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit

extension UIImage{
    
    func aspectRatio(multiplier: CGFloat,of view:UIView) -> CGSize{
        let width = multiplier * view.bounds.width
        let height = CGFloat(width) * (self.size.height / self.size.width)
        
        return CGSize(width: width, height: height)
    }
    
    /// Returns a image that fills in newSize
    func resizedImage(newSize: CGSize) -> UIImage {
        // Guard newSize is different
        guard self.size != newSize else { return self }
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        self.draw(in: CGRect(x:0, y:0, width:newSize.width, height:newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func jpeg(_ quality: JPEGQuality) -> Data? {
        return UIImageJPEGRepresentation(self, quality.rawValue)
    }
    
    // MARK: - UIImage+Resize
    func compressTo(_ expectedSizeInMb:Int) -> UIImage? {
        let sizeInBytes = expectedSizeInMb * 1024 * 1024
        var needCompress:Bool = true
        var imgData:Data?
        var compressingValue:CGFloat = 1.0
        while (needCompress && compressingValue > 0.0) {
            if let data:Data = UIImageJPEGRepresentation(self, compressingValue) {
                if data.count < sizeInBytes {
                    needCompress = false
                    imgData = data
                } else {
                    compressingValue -= 0.1
                }
            }
        }
        
        if let data = imgData {
            if (data.count < sizeInBytes) {
                return UIImage(data: data)
            }
        }
        return nil
    } 

}

extension UIImageView {
    func loadImageUsingUrlString(urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Cannot create Url")
            return
        }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        
        }.resume()
//        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            if error != nil {
//                print(error)
//                return
//            }
//
//            DispatchQueue.main.async{
//                self.image = UIImage(data: data!)
//            }
//        }.resume()
    }
}
