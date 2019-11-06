//
//  Chart.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 7/13/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import Foundation

struct Chart:Codable {
    let order_id: Int
    let user_id: Int
    let user_name: String
    let product_id: Int
    let product_name: String
    let follow_up: Int
    let description: String?
    let marketing_id:Int = 0
    let marketing_name:String = ""
}
