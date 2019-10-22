//
//  UserDefaultsUtils.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 7/4/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    func setLoggedIn(to value:Bool){
        set(value, forKey: "isLoggedIn")
        synchronize()
    }
    
    func setUserData(user:AuthResponse) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            set(encoded, forKey: "user")
            synchronize()
        }
    }
    
    func getUserData() -> AuthResponse{
        
        if let user = object(forKey: "user") {
            let data = user as! Data
            let decoder = JSONDecoder()
            do {
                let user = try decoder.decode(AuthResponse.self, from: data)
                return user
            } catch let err {
                print("Cannot decode UserData", err)
                return AuthResponse(id: 0, email: "", name: "", token: "")
            }
        }else{
            return AuthResponse(id: 0, email: "email", name: "user", token: "token")
        }
        
    }
    
    func isLoggedIn() -> Bool{
        return bool(forKey: "isLoggedIn")
    }
    
    func setLoginType(type:String) {
        set(type, forKey: "loggintype")
        synchronize()
    }
    
    func getLogginType() -> String {
        let t = string(forKey: "loggintype")
        return t!
    }
    
}
