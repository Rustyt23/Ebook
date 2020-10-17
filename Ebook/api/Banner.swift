//
//  Banner.swift
//  Ebook
//
//  Created by Rustyt Rooser on 13/10/20.
//

import SwiftUI

struct bannerView:View {
    @State var height:CGFloat
    @State  var width : CGFloat
    @ObservedObject var manager = Banner_request()
    var body: some View{
        VStack{
            if self.manager.jsonData.status{
                
                ScrollView(.horizontal,showsIndicators: false)
                {
                    HStack{
        //                Group{
                    ForEach(self.manager.jsonData.data!, id: \._id) { s in
                        VStack{
                            RemoteImage(url: s.cover_image) .frame(width: UIScreen.main.bounds.width - self.width, height: (UIScreen.main.bounds.width - self.width) * (3/2), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(10).shadow(radius:3).padding(.horizontal,4)
                            Text(s.title).font(.system(size: 15)).fontWeight(.regular).padding(.top,10).fixedSize().shadow(radius:10 )
                            
                          
                            }
                        }
                }
                    
                    
                    //        }
                }
            } }.onAppear(perform: {
                self.manager.getAuth()
            } )
    }
}



class Banner_request: ObservableObject{
    @Published var jsonData =  Banner_model()
    @Published var auth = false
    func getAuth() {
        guard let url = URL(string: "http://143.110.185.192:5000/api/book/banner") else { print("URL not working")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, response, error) in

            guard let data = data else { return }
            let resData = try! JSONDecoder().decode(Banner_model.self, from: data)
            DispatchQueue.main.async
            {
            self.jsonData = resData
                self.auth = resData.status
                
            }
         
        }.resume()
     
    }
}
