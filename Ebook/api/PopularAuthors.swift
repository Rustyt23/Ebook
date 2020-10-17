//
//  PopularAuthors.swift
//  Ebook
//
//  Created by Rustyt Rooser on 13/10/20.
//

import SwiftUI

struct popular_author:View {
    @ObservedObject var manager = Author_request()
    var body: some View{
        VStack{
        if self.manager.jsonData.status{
          
            ScrollView(.horizontal,showsIndicators: false)
            {
            HStack{
//                Group{
            ForEach(self.manager.jsonData.data!, id: \.id) { s in
                VStack{
                    RemoteImage(url: s.image!).frame(width: 100, height: 100).cornerRadius(90).shadow(radius:3).padding(.horizontal,4)
                    Text(s.name!).font(.system(size: 15)).fontWeight(.regular).padding(.top,10).fixedSize().shadow(radius:10 )
                    }
                }
        }
//        }
        }
        }
        
        else {Text("Loading").shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ ).shadow(radius: 20 )
            
        }
        }.onAppear(perform: {
            self.manager.getAuth()
         
        })
    }
}

class Author_request: ObservableObject{
    @Published var jsonData = Author_model()
func getAuth() {
    guard let url = URL(string: "http://143.110.185.192:5000/api/book/popular_authors") else { print("URL not working")
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    URLSession.shared.dataTask(with: request) { (data, response, error) in

        guard let data = data else { return }
        let resData = try! JSONDecoder().decode(Author_model.self, from: data)
        DispatchQueue.main.async
        {
        self.jsonData = resData
            
        }
    
        if resData.data != nil {
        }
    }.resume()
 
}

}
