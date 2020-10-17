import SwiftUI
struct Banner_model : Codable {
    var status: Bool = false
    var data: [Datum]?
    var message: String?

}

// MARK: - Datum
struct Datum : Codable {
    let author: [Author]
    let genres: [String]
    var _id, title, summary: String
    var cover_image: String
    var year, pages: Int
    var isbn: String
    var rating: Int
    var reviews: [Review]
    var price, discounted_price, rent_price: Int
    var favorite: Bool
}

// MARK: - Author
struct Author : Codable {
    let _id, name: String?
    let image: String?

   
}
struct Review: Codable {
    var _id, review: String?
    var user: User?
    var created: String?

}

struct User: Codable {
    var image: String?
    var name: String?
}

