//
//  json.swift
//  Ebook
//
//  Created by Rustyt Rooser on 03/10/20.
//

import SwiftUI

struct j1: Codable {
    var message: [j2]
}

struct j2: Codable {
    var PAGES: Int
    var Title: String
    var Genre: String
}


struct j3: View {
    
    public var urlLink:String = "nhttp://143.110.185.192:5000/api/bookDetails/5f705ac246e5665594dceae0"
   
    @State private var message = [j2]()

    var body: some View {
        List(message, id: \.PAGES) { item in
            VStack(alignment: .leading) {
                Text(item.Title)
                    .font(.headline)
                Text(item.Genre)
            }
        }.onAppear(perform: {
            loadData()
        })
    }
    func loadData() -> Void {
        guard let url = URL(string: urlLink) else {
            print("Invalid URL")
            return
        }
        let message = URLRequest(url: url)
        URLSession.shared.dataTask(with: message) { data, response, error in
            // step 4
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(j1.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        self.message = decodedResponse.message
                    }

                    // everything is good, so we can exit
                    return
                }
                else {
                    print("error")
                }
            }

            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            
        }.resume()
        
    }
}

struct j4: PreviewProvider {
    static var previews: some View {
        j3()
    }
}
