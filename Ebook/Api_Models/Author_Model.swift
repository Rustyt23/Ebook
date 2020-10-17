//
//  Author_Model.swift
//  Ebook
//
//  Created by Rustyt Rooser on 13/10/20.
//

import SwiftUI

import Foundation

// MARK: - Welcome
struct Author_model: Codable {
    var status: Bool = false
    var data: [Datum2]?
    var message: String?
}

// MARK: - Datum
struct Datum2: Codable {
    var id, name: String?
    var image: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, image
    }
}
