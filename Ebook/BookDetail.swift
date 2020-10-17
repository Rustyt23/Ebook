//
//  Books.swift
//  Ebook
//
//  Created by Rustyt Rooser on 07/10/20.
//

import SwiftUI

struct BookDetail: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var bookid:String = "5f7d806149186e1be4b31879"
    @ObservedObject var manager = BookDetail_request()
    var body: some View {
        VStack{
            if self.manager.jsonData.status {
                ZStack(alignment: .center ){
                RemoteImage(url: self.manager.jsonData.data![0].cover_image).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width - 100).blur(radius: 20)
                    Button(action: {
                       self.presentationMode.wrappedValue.dismiss()
                    }) {
                        back().foregroundColor(.white).offset(y:10)
                    }.navigationBarHidden(true)
                VStack{
                    //                    Text("Book").foregroundColor(.white).font(.title2)
                    RemoteImage(url: self.manager.jsonData.data![0].cover_image)
                        .frame(width: (UIScreen.main.bounds.width)/4 , height: UIScreen.main.bounds.width/2)
                        .cornerRadius(16)
                    Text(self.manager.jsonData.data![0].title).foregroundColor(.white).font(.title2)
                    Text(self.manager.jsonData.data![0].author[0].name!).foregroundColor(.white).font(.title3)
                    
                    
                    HStack{
                        Image(systemName: self.manager.jsonData.data![0].rating > 1 ? "star.fill": "star").foregroundColor(Color("gold"))
                        Image(systemName: self.manager.jsonData.data![0].rating > 2 ? "star.fill": "star").foregroundColor(Color("gold"))
                        Image(systemName: self.manager.jsonData.data![0].rating > 3 ? "star.fill": "star").foregroundColor(Color("gold"))
                        Image(systemName: self.manager.jsonData.data![0].rating > 4 ? "star.fill": "star").foregroundColor(Color("gold"))
                        Image(systemName: self.manager.jsonData.data![0].rating > 5 ? "star.fill": "star").foregroundColor(Color("gold"))
                       
                    }
                }
            }
            HStack{
                Button(action:{
                    
                    
                })
                {
                    NavigationLink(
                        destination: cat()
                            .navigationBarHidden(true),
                        label: {
                            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                
                                ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/, content: {
                                    Rectangle()
                                        .frame(width: (UIScreen.main.bounds.width)/3, height: 60.0).cornerRadius(10).foregroundColor(Color("dirtblue")//
                                        )                                 //.opacity(0.9))
                                    Text("Buy for Rs \(self.manager.jsonData.data![0].discounted_price)").bold().foregroundColor(Color.white.opacity(0.8))
                                }).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                                
                            })
                            .padding()
                        })
                }
                Button(action:{
                    
                    
                })
                {
                    NavigationLink(
                        destination: cat()
                            .navigationBarHidden(true),
                        label: {
                            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                
                                ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/, content: {
                                    Rectangle()
                                        .frame(width: (UIScreen.main.bounds.width)/3, height: 60.0).cornerRadius(10).foregroundColor(.white//
                                        )                                 //.opacity(0.9))
                                    Text("Read Fragment").bold().foregroundColor(Color.black.opacity(0.8))
                                }).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                                
                            })
                            .padding()
                        })
                }
            }
            Divider()
                //SUMARRY
                
                HStack{
                    RemoteImage(url: self.manager.jsonData.data![0].author[0].image!).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                        .clipShape(Circle())
//                        .cornerRadius(1)
                       
                 
                    Text(self.manager.jsonData.data![0].author[0].name!)
                    Spacer()
                }.padding(.horizontal)
                
                Text("Summary").font(.title2)
                Text(self.manager.jsonData.data![0].summary).font(.caption).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                HStack{
                ForEach(self.manager.jsonData.data![0].genres, id: \.self) { s in
//                    ZStack{
                       
                    Text(s.self).font(.caption).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).foregroundColor(.white).shadow(radius: 2).padding(.horizontal,5).background( Color(.gray).opacity(0.6).cornerRadius(10))
                    
                }
                }
            Spacer()
        }
            
            else {
                Text("Loading...")
            }
            
        }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .onAppear(perform: {
            self.manager.getAuth(book_id: self.bookid)
        })
    }
}


struct Books_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail()
        
    }
}

class BookDetail_request: ObservableObject{
    @Published var jsonData =  Banner_model()
    @Published var auth = false
    func getAuth(book_id: String) {
        guard let url = URL(string: "http://143.110.185.192:5000/api/book/book_detail/\(book_id)") else { print("URL not working")
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
