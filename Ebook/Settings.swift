import SwiftUI

struct sett: Identifiable {
    var id = UUID()
    var name: String
    
    var imageName: String
  @State  var status: Bool

}


let settinglist = [sett(name: "Change Password", imageName: "lock.fill",status: false),sett(name: "Notifications", imageName: "bell.fill",status: false),sett(name: "Privacy Settings", imageName: "hand.raised.fill",status: false),sett(name: "Sign Out", imageName: "figure.walk",status: false)]
let arr: Array<String>=["h","g"]

struct settings: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View{
        
       
        
        VStack{
            Button(action: {
               self.presentationMode.wrappedValue.dismiss()
            }) {
                back().foregroundColor(.black).offset(y:10)
            }
            .navigationBarHidden(true)
            HStack{
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.bold)
                Spacer()
            }.padding(10)
            HStack{
                Text("Account")
                    .font(.title2)
                    .fontWeight(.bold)
                    Spacer()
                }.padding(10)
        ScrollView(.vertical) {
            VStack {
                ForEach(settinglist){ s in
                  
//                    Button(action:
//                            {
//                        if s.name == "Sign Out"
//                            { s.status = true}
//                            }
//                    )
//                    { NavigationLink(destination:
////                                        ( s.status ? Login() : settings)
//                        Login()
//                        ,  label: {
                    HStack{
                        ZStack{
                            Rectangle()
                                .frame(width: 30.0, height: 35.0).cornerRadius(8).foregroundColor(Color(red: 103/255, green: 117/255, blue: 157/255).opacity(0.9))
                            Image(systemName: s.imageName).colorInvert()
                        
                        }
                        Text(s.name)
                            .fontWeight(.medium)
                        Spacer()
                        forward().padding(.trailing,10)
                    }.padding(.leading,10)
//                    })
                    Divider().padding(0)
//                }
                    
//                }
            }
            
            HStack{
            Text("More Options")
                .font(.title2)
                .fontWeight(.bold)
                Spacer()
            }.padding(.leading,10).padding(.top,30).padding(.bottom)
            VStack {
                
                    HStack{
                        Text("Newsletter")
                            .fontWeight(.medium)
                        Spacer()
                        Text("news").foregroundColor(.gray)
                        forward().padding(.trailing,10)
                    }.padding(.leading,10)
                    
                    Divider().padding(0)
                HStack{
                    Text("Currency")
                        .fontWeight(.medium)
                    Spacer()
                    Text("$-USD").foregroundColor(.gray)
                    forward().padding(.trailing,10)
                }.padding(.leading,10)
                
                Divider().padding(0)
                HStack{
                    Text("Language")
                        .fontWeight(.medium)
                    Spacer()
                    Text("English").foregroundColor(.gray)
                    forward().padding(.trailing,10)
                }.padding(.leading,10)
                
                Divider().padding(0)
                HStack{
                    Text("Linked Accounts")
                        .fontWeight(.medium)
                    Spacer()
                    Text("Facebook,Google").foregroundColor(.gray)
                    forward().padding(.trailing,10)
                }.padding(.leading,10)
                
                Divider().padding(0)
                
                
            }
        
        
        
        
        
        
        
        }
        }}
}
}



struct Settings_Previewss: PreviewProvider {
    static var previews: some View {
 
   settings()
        
    }
}
