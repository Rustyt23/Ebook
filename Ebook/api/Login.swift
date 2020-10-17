
import SwiftUI


struct Login: View {
    @State  var email:String = ""
    @State  var password:String = ""
    var status = false
    @StateObject var manager = Login_service()
    var body: some View {
      
        
       if  self.manager.tokenstored != nil || self.manager.token != nil {
       
        Home(managerkid: manager).onAppear(perform: {
            if  self.manager.tokenstored != nil {
            self.manager.token = self.manager.tokenstored
            }
        })
            
        }
        
        else{
            
            NavigationView{
                
                VStack{
                    ScrollView(.vertical,showsIndicators: false){
                        ZStack(alignment:.leading){
                            Image("business2").resizable().frame(width: UIScreen.main.bounds.width, height:( UIScreen.main.bounds.width)/1.5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).opacity(0.5).background(Color.black).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                            // .background(LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom))
                            VStack{  Text("Welcome back").font(.system(size: 35)).fontWeight(.bold).foregroundColor(Color.white).multilineTextAlignment(.leading).padding(.leading).frame(width: (UIScreen.main.bounds.width)/1.8, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Text("Sign in to continue")
                                    .foregroundColor(Color.white).padding(.top,0)
                            }.padding(.top,80)
                        }
                        VStack{
                            HStack{
                                Image(systemName: "person.fill").foregroundColor(.gray).padding(.trailing,30)
                                TextField("Enter your email",text: $email)
                                
                            }.padding(.top).padding(.leading)
                            Divider()
                            HStack{
                                Image(systemName: "lock.fill").foregroundColor(.gray).padding(.trailing,30)
                                SecureField("Password",text: $password)
                                
                            }.padding(.top).padding(.leading)
                            Divider()
                            HStack{
                                Button(action:{
                                    
                                    
                                })
                                {
                                    NavigationLink(
                                        destination: ForgotPaaswordView()
                                            .navigationBarHidden(true),
                                        label: {
                                            Text("Forgot Password?").foregroundColor(.black).padding()
                                        }
                                    )}
                                
                                Spacer()
                            }
                        }.padding(.leading)
                        
                        
                        if self.manager.msgauthenticated ||  self.manager.authenticated {
                            if self.manager.msgauthenticated {
                                Text(self.manager.message).foregroundColor(.red)
                            }
                            
                            else {
                                cat()
                                
                                
                            }
                        }
                        
                        Button(action:{  self.manager.postAuth(email: self.email, password: self.password)
                            
                        })
                        {
                            //                NavigationLink(
                            //                destination: Home().navigationBarHidden(true),
                            //                label: {
                            
                            HStack {
                                
                                ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/, content: {
                                    Rectangle()
                                        .frame(width: 327.0, height: 60.0).cornerRadius(10).foregroundColor(Color("dirtblue")//
                                        )                                 //.opacity(0.9))
                                    
                                    Text("Sign in").bold().foregroundColor(Color.white.opacity(0.8))
                                }).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                                
                                //                })
                            }
                            
                            
                        }       //fggg
                        Spacer()
                        Text("or connect").foregroundColor(.gray)
                        
                        HStack{
                            Button(action:{
                                
                            })
                            {
                                NavigationLink(
                                    destination: cat(),
                                    label: {
                                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                            
                                            ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/, content: {
                                                Rectangle()
                                                    .frame(width: (UIScreen.main.bounds.width)/2.5, height: 60.0).cornerRadius(10).foregroundColor(Color(.white)//
                                                    )                                 //.opacity(0.9))
                                                Text("Google").bold().foregroundColor(Color.black.opacity(0.8))
                                            }).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ ).border(Color("dirtblue")).cornerRadius(9)
                                            
                                        })
                                        .padding()
                                    })
                            }
                            Button(action:{
                                
                            })
                            {
                                NavigationLink(
                                    destination: cat(),
                                    label: {
                                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                            
                                            ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/, content: {
                                                Rectangle()
                                                    .frame(width: (UIScreen.main.bounds.width)/2.5, height: 60.0).cornerRadius(10).foregroundColor(Color(.white)//
                                                    )                                 //.opacity(0.9))
                                                Text("Facebook").bold().foregroundColor(Color.black.opacity(0.8))
                                            }).shadow(radius: 10 ).border(Color("dirtblue")).cornerRadius(9)
                                            
                                        })
                                        .padding()
                                    })
                            }.padding(0)
                        }
                        
                        HStack{
                            Text("Don't have an Account?").foregroundColor(.gray)
                            Button(action:{
                                
                            })
                            {
                                NavigationLink(
                                    destination: SignUp()
                                        .navigationBarHidden(true))
                                {
                                    
                                    
                                    Text("Sign Up").foregroundColor(.black)
                                    
                                }
                            }
                            
                        }.padding(.bottom,20)
                        
                    }
                }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}



class Login_service: ObservableObject {
    
    @Published var authenticated = false
    @Published var jsonData = login_model()
    @Published var msgauthenticated = false
    
    //    @Published var tokendata:String  = ""
    @Published var token : String?
    @Published var tokenstored = UserDefaults.standard.string(forKey: "Token")
    @Published var message : String  = ""
    
   
    
    
    
    func postAuth(email: String, password: String) {
        guard let url = URL(string: "http://143.110.185.192:5000/api/user/login") else { print("URL not working")
            return
        }
        if tokenstored != nil {
            print("token stored is not nil")
            print(tokenstored!)
            token = tokenstored
        }
        let body: [String: String] = ["email": email, "password": password]
        
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            let resData = try! JSONDecoder().decode(login_model.self, from: data)
            DispatchQueue.main.async {
                
                if resData.status == true {
                    self.authenticated = resData.status
                }
//                ....................................
                if resData.data != nil {
                    self.token = resData.data![0].token!
                    UserDefaults.standard.set(self.token, forKey: "Token")
                }
                if resData.message != nil {
                    self.msgauthenticated = true
                    self.message = resData.message!
                }
                self.jsonData = resData
                
            }
            
            
        }.resume()
    }
    func Signup(name: String, email: String, password: String) {
        guard let url = URL(string: "http://143.110.185.192:5000/api/user/signup") else { print("URL not working")
            return
        }
        
        let body: [String: String] = ["name": name,"email": email, "password": password]
        
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            let resData = try! JSONDecoder().decode(login_model.self, from: data)
            DispatchQueue.main.async {
                if resData.status == true {
                    self.authenticated = resData.status
                }
                if resData.data != nil {
                    self.token = resData.data![0].token!
                }
                if resData.message != nil {
                    self.msgauthenticated = true
                    self.message = resData.message!
                }
                self.jsonData = resData
            }
            
            
            
        }.resume()
    }
}
