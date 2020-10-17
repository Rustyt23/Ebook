//
//  FavoriteBooks.swift
//  Ebook
//
//  Created by Rustyt Rooser on 14/10/20.
//

import SwiftUI

struct FavoriteBooks: View {
    @State  var width : CGFloat
    @ObservedObject var manager = favorite_request()
    @ObservedObject var sender = favorite_post()
    @ObservedObject var managerkid3 : Login_service
    var body: some View{
        VStack{
            if self.manager.jsonData.status{
                
                ScrollView(.horizontal,showsIndicators: false)
                {
                    HStack{
                    ForEach(self.manager.jsonData.data!, id: \._id) { s in
                        VStack(alignment:.leading){
                            ZStack(alignment:.bottomLeading){
                                RemoteImage(url: s.cover_image) .frame(width: UIScreen.main.bounds.width - self.width, height: (UIScreen.main.bounds.width - self.width) * (3/2), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(10).shadow(radius:3).padding(.horizontal,4)
                                Color.black.opacity(0.5).frame(width: UIScreen.main.bounds.width - self.width, height: (UIScreen.main.bounds.width - self.width) * (3/2), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(10).shadow(radius:10).cornerRadius(10).padding(.horizontal,4)
                                
                                HStack{
                                    Button(action: {
                                        self.sender.postAuth(book_id: s._id, auth: managerkid3.token!)
                                    }, label: {
                                        Image(systemName: "heart.fill")
                                          .resizable()
//                                            .renderingMode(.original)
                                            .accentColor(.red)
                                        //    .colorInvert()
//                                            .opacity(0.6)
                                            .frame(width:(UIScreen.main.bounds.width - self.width)/6, height: (UIScreen.main.bounds.width - self.width)/6 )
                                            .padding(10)
                                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                                    })
                                   
                                    Spacer()
                                    HStack{
                                        Image(systemName: "star.fill").foregroundColor(Color("gold"))
                                    Text(String(s.rating)).foregroundColor(.white).fixedSize() .padding(.trailing,8).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                        Spacer()
                                    }.frame(width:(UIScreen.main.bounds.width - self.width)/6, height: (UIScreen.main.bounds.width - self.width)/6 )
                                   
                                }.frame(width: (UIScreen.main.bounds.width - self.width))
                            }
                            Text(s.title).font(.system(size: 20)).fontWeight(.medium).shadow(radius:5 ).multilineTextAlignment(.center).shadow(radius:2 )
                            Text(s.author[0].name!).font(.system(size: 15)).fontWeight(.thin).multilineTextAlignment(.leading).padding(.top,0).fixedSize().shadow(radius:10 ).padding(.horizontal,8)
                        }.frame(width: (UIScreen.main.bounds.width - self.width),height: (UIScreen.main.bounds.width - self.width) * 2 )
                        }
                }
                    
                    
                    //        }
                }
            } }.onAppear(perform: {
                self.manager.getAuth(authtoken: managerkid3.token!)
            } )
    }
}



class favorite_request: ObservableObject{
    @Published var jsonData =  Banner_model()
    @Published var auth = false
    func getAuth(authtoken: String) {
        guard let url = URL(string: "http://143.110.185.192:5000/api/book/favorite_book") else { print("URL not working")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(authtoken, forHTTPHeaderField: "auth-token")
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




class favorite_post: ObservableObject{
@Published var authenticated = false
    func postAuth(book_id: String , auth: String) {
    guard let url = URL(string: "http://143.110.185.192:5000/api/book/favorite_book") else { print("URL not working")
        return
    }

    let body: [String: String] = ["book_id": book_id]

    let finalBody = try! JSONSerialization.data(withJSONObject: body)

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = finalBody
    request.setValue(auth, forHTTPHeaderField: "auth-token")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard let data = data else { return }
        let resData = try! JSONDecoder().decode(PostBookId.self, from: data)
           
        
            
        
    
       
        if resData.status == true {
            DispatchQueue.main.async {
                self.authenticated = resData.status
                
            }
        }
      
    }.resume()
}
}

struct PostBookId: Codable {
    var status = false
    var message:String?
    }
