//
//  Userdetail.swift
//  Ebook
//
//  Created by Rustyt Rooser on 13/10/20.
//

import SwiftUI

struct userDetail_model: Codable {
    var status: Bool = false
    var data: [datam3]?
    var message: String?
}

struct datam3: Codable {
    var image: String
    var name: String
    var email:String
}



