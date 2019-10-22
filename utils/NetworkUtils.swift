//
//  NetworkUtils.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 7/2/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit

class NetworkUtils:NSObject {
    
    let KEY = "simplekey"
    let INIT_VECTOR = "1234123412341234"
    let BASE_URL:String = "http://128.199.136.205:3000/api/"
    let BASE_URL_IMAGE: String = "http://128.199.136.205:3000/images/"
    let cryptLib = CryptLib()
    
    
    func encrypt(plainText:String) -> String{
        return cryptLib.encryptPlainTextRandomIV(withPlainText: plainText, key: KEY)
    }
    
    func decrypt(cipherText:String) -> String{
        return CryptLib().decryptCipherTextRandomIV(withCipherText: cipherText, key: KEY)
    }
    
    override init(){
        super.init()
    }
    
    func fetchData<T:Decodable>(endPoint: String,completion: @escaping (T) -> (),err:
    @escaping (Bool) -> ()) {
        let urlString = "\(BASE_URL)\(endPoint)"
        
        guard let url = URL(string: urlString) else {
            print("Cannot create Url")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let userData:AuthResponse = UserDefaults().getUserData()
        
        let token = userData.token
        let email = userData.email
        
        urlRequest.setValue(token, forHTTPHeaderField: "x-access-token")
        urlRequest.setValue(email, forHTTPHeaderField: "x-email")
        
        URLSession.shared.dataTask(with: urlRequest){
            (data,response,error) in
            
            guard error == nil else {
                print("error calling POST on \(endPoint)")
                print(error!)
                err(true)
                return
            }
            
            guard let data = data else {
                print("Error: did not receive data")
                err(true)
                return
            }
            
            do {
                guard let stringData = String(data:data,encoding:.utf8) else {return}
                let decryption = self.decrypt(cipherText: stringData)
                guard let decryptionData = decryption.data(using: .utf8) else {return}
                print("Data From Server",decryption)
                let obj = try JSONDecoder().decode(T.self, from:decryptionData)
                completion(obj)
            }catch let jsonError{
                print("Failed to decode json :",jsonError)
                err(true)
            }
            }.resume()
    }
    
    func order<T:Decodable>(endPoint: String,completion: @escaping (T) -> (),err:
        @escaping (Bool) -> ()) {
        let urlString = "\(BASE_URL)\(endPoint)"
        
        guard let url = URL(string: urlString) else {
            print("Cannot create Url")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        let userData:AuthResponse = UserDefaults().getUserData()
        
        let token = userData.token
        let email = userData.email
        
        urlRequest.setValue(token, forHTTPHeaderField: "x-access-token")
        urlRequest.setValue(email, forHTTPHeaderField: "x-email")
        
        URLSession.shared.dataTask(with: urlRequest){
            (data,response,error) in
            
            guard error == nil else {
                print("error calling POST on \(endPoint)")
                print(error!)
                err(true)
                return
            }
            
            guard let data = data else {
                print("Error: did not receive data")
                err(true)
                return
            }
            
            do {
                guard let stringData = String(data:data,encoding:.utf8) else {return}
                let decryption = self.decrypt(cipherText: stringData)
                guard let decryptionData = decryption.data(using: .utf8) else {return}
                let obj = try JSONDecoder().decode(T.self, from:decryptionData)
                completion(obj)
            }catch let jsonError{
                print("Failed to decode json :",jsonError)
                err(true)
            }
            }.resume()
        
    }
    
    func postData<T:Decodable> (endPoint:String, body:Data, completion: @escaping (T) -> (), err: @escaping (Bool) -> ()) {
        let urlString = "\(BASE_URL)\(endPoint)"

        guard let url = URL(string: urlString) else {
            print("Cannot create Url")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = body
        
        let userData:AuthResponse = UserDefaults().getUserData()
        
        let token = userData.token
        let email = userData.email
        
        urlRequest.setValue(token, forHTTPHeaderField: "x-access-token")
        urlRequest.setValue(email, forHTTPHeaderField: "x-email")
        
        URLSession.shared.dataTask(with: urlRequest){
            (data,response,error) in
            
            guard error == nil else {
                print("error calling POST on \(endPoint)")
                print(error!)
                err(true)
                return
            }
            
            guard let data = data else {
                print("Error: did not receive data")
                err(true)
                return
            }
            do {
                guard let stringData = String(data:data,encoding:.utf8) else {return}
                let decryption = self.decrypt(cipherText: stringData)
                guard let decryptionData = decryption.data(using: .utf8) else {return}
                print("Response from server",decryptionData)
                let obj = try JSONDecoder().decode(T.self, from:decryptionData)
                completion(obj)
            }catch let jsonError{
                print("Failed to decode json :",jsonError)
                err(true)
            }
            }.resume()
    }
}
