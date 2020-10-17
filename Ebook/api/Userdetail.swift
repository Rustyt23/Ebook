//
//  Userdetail.swift
//  Ebook
//
//  Created by Rustyt Rooser on 13/10/20.
//

import SwiftUI

struct userDetail_profile: View {
    @ObservedObject var manager =  userDetail_request()
    @ObservedObject var managerkid3 : Login_service
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
        VStack(alignment:.leading){
                
            if self.manager.jsonData.status  {
                
                HStack{
                    ZStack(alignment: .bottomTrailing){
                        RemoteImage(url: self.manager.jsonData.data![0].image).clipShape(Circle()).frame(width: (UIScreen.main.bounds.width)/4, height: (UIScreen.main.bounds.width)/4, alignment: .leading)
                        Color("dirtblue").clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).frame(width: (UIScreen.main.bounds.width)/12, height: (UIScreen.main.bounds.width)/12)
                        Image(systemName: "pencil").colorInvert().frame(width: (UIScreen.main.bounds.width)/12, height: (UIScreen.main.bounds.width)/12)
                    }
                    VStack(alignment:.leading){
                        Text(self.manager.jsonData.data![0].name)
                            .font(.title)
                            .fontWeight(.semibold)
                        Text(self.manager.jsonData.data![0].email).font(.caption).foregroundColor(.gray)
//                        Text(managerkid3.token!)
                    }
                    Spacer()
                }.padding(.horizontal)
                
               
            }
            
//        FavoriteBooks(height: 500, width: 250)
             
        }.onAppear(perform: {
            self.manager.getAuth(auth: managerkid3.token!)
        })
    
        }.navigationBarHidden(true)

       
    }
    
}



class userDetail_request: ObservableObject{
    @Published var jsonData =  userDetail_model()
    func getAuth(auth: String) {
    guard let url = URL(string: "http://143.110.185.192:5000/api/user/user_detail") else { print("URL not working")
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue(auth, forHTTPHeaderField: "auth-token")
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard let data = data else { return }
        let resData = try! JSONDecoder().decode(userDetail_model.self, from: data)
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
