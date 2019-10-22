//
//  CustomFbLoginButton.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 7/29/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import Foundation
import FBSDKLoginKit

class CustomFBLoginButton: FBSDKLoginButton {
    
    override func setTitle(_ title: String?, for state: UIControlState) {
        super.setTitle("Sign In with Facebook", for: state)
    }
    
}
