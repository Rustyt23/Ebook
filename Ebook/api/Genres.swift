//
//  Genres.swift
//  Ebook
//
//  Created by Rustyt Rooser on 14/10/20.
//

import SwiftUI

struct Genres: View {
    @ObservedObject var manager =  genres_request()
    var body: some View {
        
        HStack{
            if self.manager.jsonData.status  {
                ForEach(self.manager.jsonData.data!, id: \.self) { s in
                    
                    
                    
                    VStack{
                        Text(s.self).foregroundColor(Color("dirtblue")).padding(10) .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(lineWidth: 2).foregroundColor(Color("dirtblue"))
                        ).padding(.horizontal)
                    }
                    
                    
                    
                }
            }
            
        }
        .onAppear(perform: {
            self.manager.getAuth()
        })
    }
}


class genres_request: ObservableObject{
    @Published var jsonData =  Genre_Model()
    func getAuth() {
        guard let url = URL(string: "http://143.110.185.192:5000/api/book/genres") else { print("URL not working")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            let resData = try! JSONDecoder().decode(Genre_Model.self, from: data)
            DispatchQueue.main.async {  self.jsonData = resData}
            //            self.message! = resData.data![0].title!
            //            self.title! = resData.data![0].title!
            
            //        for people in resData.data! {
            //               print(people)
            //           }
            //        print(self.title)
            
        }.resume()
        
    }
    
}

struct Genres_Previews: PreviewProvider {
    static var previews: some View {
        Genres()
    }
}
