//
//  profile.swift
//  Ebook
//
//  Created by Rustyt Rooser on 07/10/20.
//

import SwiftUI

let cardlist = [Card(imagename: "art", type: "Arts", show: false),Card(imagename: "bio", type: "Biography", show: false),Card(imagename: "business2", type: "Business", show: false),Card(imagename: "photography", type: "Photography", show: false),Card(imagename: "classic", type: "Classic", show: false),Card(imagename: "drama", type: "Drama", show: false),Card(imagename: "history", type: "History", show: false)]



struct profile: View {
 @State   var setting_status = true
    @ObservedObject var managerkid2 : Login_service

    var body: some View {
        NavigationView{
        
       
            VStack{
        
        ScrollView(.vertical,showsIndicators: false){
        VStack(alignment:.leading){
        VStack(alignment:.leading){
        HStack{
            Button(action: {
                self.setting_status.toggle()
                print(setting_status)
                print(self.setting_status)
            }) {NavigationLink(
                destination: settings()
                , label: {
                Image(systemName: "gearshape")
                    .foregroundColor(.black)
            })
            }
       
          //  Image(systemName: "")
        }.padding(.horizontal)
                
                
            userDetail_profile(managerkid3: managerkid2 )

         /*       HStack{
                    ZStack(alignment: .bottomTrailing){
                    Image("photography").resizable().clipShape(Circle()).frame(width: (UIScreen.main.bounds.width)/4, height: (UIScreen.main.bounds.width)/4, alignment: .leading)
                        Color("dirtblue").clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).frame(width: (UIScreen.main.bounds.width)/12, height: (UIScreen.main.bounds.width)/12)
                        Image(systemName: "pencil").colorInvert().frame(width: (UIScreen.main.bounds.width)/12, height: (UIScreen.main.bounds.width)/12)
                    }
                    VStack(alignment:.leading){
                        Text("Rustyt Rooser")
                            .font(.title)
                            .fontWeight(.semibold)
                        Text("rustytrooser@gmail.com").font(.caption).foregroundColor(.gray)
                    }
                    Spacer()
                }.padding(.horizontal)
            
                
                HStack(alignment:.center){
                    
                    VStack(alignment:.leading){
                        Text("54")
                            .font(.title)
                            .fontWeight(.semibold)
                        Text("Bookmarks").font(.caption).foregroundColor(.gray)
                    }
                    Spacer()
                    Divider()
                    Spacer()
                    VStack(alignment:.leading){
                        Text("23")
                            .font(.title)
                            .fontWeight(.semibold)
                        Text("Following").font(.caption).foregroundColor(.gray)
                    }
                    Spacer()
                    Divider()
                    Spacer()
                    VStack(alignment:.leading){
                        Text("45")
                            .font(.title)
                            .fontWeight(.semibold)
                        Text("Finished Books").font(.caption).foregroundColor(.gray)
                        
                    }
                }.frame(width:UIScreen.main.bounds.width - 30).padding(.horizontal).padding(.bottom)
              */
             
            }.background(Color.gray.opacity(0.05)).edgesIgnoringSafeArea(.top)
//        .shadow(radius: 1 )
            
            Text("Favorite Genres").font(.title2)
                .fontWeight(.semibold).padding(.horizontal).padding(.top)
          VStack{
                Text("Drama").foregroundColor(Color("dirtblue")).padding(10) .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 2).foregroundColor(Color("dirtblue"))
                ).padding(.horizontal)
            }
         //   Genres()
           seeall(text: "Favorites")
            FavoriteBooks(width: 300,managerkid3: managerkid2).padding()
            
        Spacer()
               
            
            
            
            
            
            
        }
        //.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
            
        }
                Spacer()
        //.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
    }
        
     
        
    }.navigationBarHidden(true)

    }
        
    
}


struct featured_books:View {
    
    var body: some View{
        ScrollView(.horizontal,showsIndicators: false)
        {
            HStack{
        ForEach(cardlist){s in
       
            VStack(alignment:.leading){
                ZStack(alignment:.bottomLeading){
                    Image(s.imagename).resizable().frame(width: (UIScreen.main.bounds.width)/3, height: (UIScreen.main.bounds.width - 200)*(1.4), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(10).shadow(radius:10).cornerRadius(10)
                    Color.black.opacity(0.5).frame(width: (UIScreen.main.bounds.width)/3, height: (UIScreen.main.bounds.width - 200)*(1.4), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(10).shadow(radius:10).cornerRadius(10)
                    
                    HStack{
                    
                        Image(systemName: "heart").resizable().colorInvert().opacity(0.6).frame(width:25, height: 25 ).padding(10).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                        Spacer()
                            Image(systemName: "star.fill").foregroundColor(Color("gold"))
                        .frame(width:20, height: 20 ).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                        Text("4.6").foregroundColor(.white).fixedSize().padding(.trailing,8).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                        
                       
                    }.frame(width: (UIScreen.main.bounds.width)/3)
                }
                Text(s.imagename).font(.system(size: 20)).fontWeight(.medium).padding(.top,0).shadow(radius:10 ).fixedSize(horizontal: true, vertical: false).padding(.horizontal,8)
                Text(s.type).font(.system(size: 15)).fontWeight(.thin).multilineTextAlignment(.leading).padding(.top,0).fixedSize().shadow(radius:10 ).padding(.horizontal,8)
            }
            
        }
                
        }
        }
        
    }
}
