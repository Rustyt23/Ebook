

import SwiftUI

struct login_model: Codable {
    var status:Bool = false
    var data: [Data_token]?
    var message: String?
}


struct Data_token: Codable{

    var token:String?
    var name:String?
    var email:String?
    var image:String?
}
