//
//  POST.swift
//  Ebook
//
//  Created by Rustyt Rooser on 09/10/20.
//
import Foundation
import SwiftUI

struct test: Codable {
    var name:String = ""
    var email:String = ""
    var password:String = ""
}
 

 

struct POST_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
