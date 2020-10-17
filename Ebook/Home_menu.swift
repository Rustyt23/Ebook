import SwiftUI

struct Card: Identifiable {
    var id = UUID()
    var imagename: String
    var type: String
    var show: Bool
    
}

struct what: Codable{
    var imagename:String
    var type:String
}

struct Home:View {
    @State var nav = [what(imagename: "magnifyingglass" , type:"Browse"), what(imagename: "book" , type:"Books") , what(imagename: "headphones" , type:"AudioBooks") ,what(imagename: "books.vertical" , type:"My Library"), what(imagename: "person" , type:"Account") ]
    @State private var selection = 1
    @ObservedObject var managerkid : Login_service

//       init() {
//           UITabBar.appearance().barTintColor = UIColor(Color("matte"))
//       }
    var body: some View{
        
        NavigationView{
        
        TabView(selection:$selection){
          
           
            BookDetail().tabItem {  Image(systemName:nav[1].imagename).foregroundColor(.gray).foregroundColor(.gray)
                Text(nav[1].type).font(/*@START_MENU_TOKEN@*/.caption/*@END_MENU_TOKEN@*/).fixedSize().foregroundColor(.gray)
             }.navigationBarHidden(true)
            Browser(manager3: managerkid).tabItem {  Image(systemName:nav[0].imagename).foregroundColor(.gray).foregroundColor(.gray)
                Text(nav[0].type).font(/*@START_MENU_TOKEN@*/.caption/*@END_MENU_TOKEN@*/).fixedSize().foregroundColor(.gray)
             }.navigationBarHidden(true)
        /*   AudioBooks().tabItem {  Image(systemName:nav[2].imagename).foregroundColor(.gray).foregroundColor(.gray)
                Text(nav[2].type).font(/*@START_MENU_TOKEN@*/.caption/*@END_MENU_TOKEN@*/).fixedSize().foregroundColor(.gray)
             } */
            Library().tabItem {  Image(systemName:nav[3].imagename).foregroundColor(.gray).foregroundColor(.gray)
                Text(nav[3].type).font(/*@START_MENU_TOKEN@*/.caption/*@END_MENU_TOKEN@*/).fixedSize().foregroundColor(.gray)
             }.navigationBarHidden(true)
            profile(managerkid2: managerkid).tabItem {
                
                Image(systemName:nav[4].imagename).foregroundColor(.gray).foregroundColor(.gray)
                    Text(nav[4].type).font(/*@START_MENU_TOKEN@*/.caption/*@END_MENU_TOKEN@*/).fixedSize()
            }
//            .navigationBarHidden(true)
        }.accentColor(Color("dirtblue")      )
        }
    }
}

struct Browser: View {
    @State var nav = [what(imagename: "magnifyingglass" , type:"Search"), what(imagename: "book" , type:"Books") , what(imagename: "headphones" , type:"AudioBooks") ,what(imagename: "books.vertical" , type:"My Library"), what(imagename: "person" , type:"Account") ]
    @ObservedObject var manager3 : Login_service
    var body: some View {
    
            
        ZStack(alignment: .bottom){
     
           
            ScrollView(.vertical,showsIndicators: false){
                
                VStack{
                    
                HStack{
                    Image(systemName: "bell.fill")
                    Spacer()
                    Text("Browse")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                    Image(systemName: "magnifyingglass")
                }.padding(.horizontal)
               /* ScrollView(.horizontal,showsIndicators: false)
                {
                HStack{
                ForEach(cardlist){s in
               
                    imagecell(height: 150, width: 200, data: s)
                }
                }
                }
                    */
                    bannerView(height: 400, width: 200)
               seeall(text: "Popular Books").padding(.top,20)
                    PopularBooks(managerkid3: manager3 )
                    /*       ScrollView(.horizontal,showsIndicators: false)
                {
                HStack{
                ForEach(cardlist){s in
               
                    ZStack{
                        Image(s.imagename).resizable().frame(width: UIScreen.main.bounds.width - 150, height: (UIScreen.main.bounds.width - 150)/2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(10).shadow(radius:2).padding(.horizontal,4)
                        Color.black.opacity(0.3).cornerRadius(10).frame(height:(UIScreen.main.bounds.width - 150)/2).padding(.horizontal,4)
                        Text(s.type).font(.system(size: 20)).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.top,10).fixedSize().foregroundColor(Color.white.opacity(0.85)).shadow(radius:10 )
                        
                    }
                    
                }
                }
            }  */
                seeall(text: "Popular Authors").padding(.top,20)
                    popular_author()
           /*     ScrollView(.horizontal,showsIndicators: false)
                {
                HStack{
                    ForEach(cardlist){s in
                   
                        VStack{
                            Image(s.imagename).resizable().frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(90).shadow(radius:3).padding(.horizontal,4)
                            Text(s.type).font(.system(size: 15)).fontWeight(.regular).padding(.top,10).fixedSize().shadow(radius:10 )
                            
                        }
                        
                    }
                    } //////333
                } */
                  
         
             /*   seeall(text: "Featured AudioBooks").padding(.top,20)
                ScrollView(.horizontal,showsIndicators: false)
                {
                    HStack{
                ForEach(cardlist){s in
               
                    VStack(alignment:.leading){
                        ZStack(alignment:.bottomLeading){
                        Image(s.imagename).resizable().frame(width: UIScreen.main.bounds.width - 200, height: UIScreen.main.bounds.width - 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(10).shadow(radius:10).cornerRadius(10).padding(.horizontal,4)
                            Image(systemName: "headphones.circle.fill").resizable().colorInvert().frame(width:30, height: 30 ).padding(10).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                        
                    }
                        Text(s.imagename).font(.system(size: 20)).fontWeight(.medium).padding(.top,0).shadow(radius:10 ).fixedSize(horizontal: true, vertical: false).padding(.horizontal,8)
                        Text(s.type).font(.system(size: 15)).fontWeight(.thin).multilineTextAlignment(.leading).padding(.top,0).fixedSize().shadow(radius:10 ).padding(.horizontal,8)
                    }
                    
                }
                }
                }
                */
                
                seeall(text: "Featured Books").padding(.top,20)
                    featuredView(height: 600, width: 250)
           /*     ScrollView(.horizontal,showsIndicators: false)
                {
                    HStack{
                ForEach(cardlist){s in
               
                    VStack(alignment:.leading){
                        ZStack(alignment:.bottomLeading){
                            Image(s.imagename).resizable().frame(width: UIScreen.main.bounds.width - 250, height: (UIScreen.main.bounds.width - 200)*(1.2), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(10).shadow(radius:10).cornerRadius(10)
                            
                            HStack{
                            
                                Image(systemName: "heart").resizable().colorInvert().opacity(0.6).frame(width:25, height: 25 ).padding(10).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                                Spacer()
                                    Image(systemName: "star.fill").foregroundColor(Color("gold"))
                                .frame(width:20, height: 20 ).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                                Text("4.6").foregroundColor(.white).fixedSize().padding(.trailing,8).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                
                               
                            }//.frame(width: 20, height: (UIScreen.main.bounds.width - 200)*(1.5),alignment: .bottom)
                        }
                        Text(s.imagename).font(.system(size: 20)).fontWeight(.medium).padding(.top,0).shadow(radius:10 ).fixedSize(horizontal: true, vertical: false).padding(.horizontal,8)
                        Text(s.type).font(.system(size: 15)).fontWeight(.thin).multilineTextAlignment(.leading).padding(.top,0).fixedSize().shadow(radius:10 ).padding(.horizontal,8)
                    }
                    
                }
                        
                }
                }
                    */
                
                   
              
            }//.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
               
            //}
           
            //Spacer()
         
            }
          
        }
        }
        
        
   
}

struct imagecell : View{
    @State var height:CGFloat
    @State  var width : CGFloat
    
    var data: Card
    var body: some View{

        
        VStack(spacing:0){
            Image(data.imagename).resizable().frame(width: UIScreen.main.bounds.width - self.width, height: (UIScreen.main.bounds.width - self.width) * (3/2), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(10).shadow(radius:3).padding(.horizontal,4)
            Text(data.type).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.top,10).fixedSize()
            
        }
        
    }
}



struct Browser_Previews: PreviewProvider {
    @ObservedObject var manager = Login_service()
    static var previews: some View {
//        Home(managerkidkid: manager)
        Login()
    }
}
