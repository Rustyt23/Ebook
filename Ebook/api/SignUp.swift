//
//  SignUp'.swift
//  Ebook
//
//  Created by Rustyt Rooser on 04/10/20.
//

import SwiftUI

//
//  Login.swift
//  Ebook
//
//  Created by Rustyt Rooser on 04/10/20.
//

import SwiftUI

struct SignUp: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State  var email:String = ""
    @State  var name:String = ""
    @State  var password:String = ""
    @ObservedObject var manager = Login_service()
    
    var body: some View {
        if self.manager.authenticated || self.manager.token != nil{
           
            Home(managerkid: manager)
                .navigationBarHidden(true)
            
        }
        
        else{
        NavigationView{
            VStack{
                ScrollView(.vertical,showsIndicators: false){
                    ZStack(alignment:.leading){
                        Image("classic").resizable().frame(width: UIScreen.main.bounds.width, height:( UIScreen.main.bounds.width)/1.5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).opacity(0.5).background(Color.black).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                        //.background(LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom))
                        VStack{  Text("Welcome User").font(.system(size: 35)).fontWeight(.bold).foregroundColor(Color.white).multilineTextAlignment(.leading).padding(.leading).frame(width: (UIScreen.main.bounds.width)/1.8, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            Text("Sign Up to continue")
                                .foregroundColor(Color.white).padding(.top,0)
                        }.padding(.top,80)
                    }
                    VStack{
                        HStack{
                            Image(systemName: "person.fill").foregroundColor(.gray).padding(.trailing,30)
                            TextField("Name",text: $name)
                            
                        }.padding(.top).padding(.leading)
                        Divider()
                        HStack{
                            Image(systemName: "paperclip").foregroundColor(.gray).padding(.trailing,25)
                            TextField("Enter your email",text: $email)
                            
                        }.padding(.top).padding(.leading)
                        Divider()
                        HStack{
                            Image(systemName: "lock.fill").foregroundColor(.gray).padding(.trailing,30)
                            SecureField("Password",text: $password)
                            
                        }
                        .padding(.top).padding(.leading)
                        Divider()
                    }
                    if self.manager.jsonData.message != nil {
                        if self.manager.authenticated {
                            Text("SignUp Successful, Now go back to login").foregroundColor(.gray)
                        }
                        else {
                            Text( self.manager.jsonData.message!).foregroundColor(.red).offset(y:30)
                        }
                    }
                    Button(action:{  self.manager.Signup(name: self.name, email: self.email, password: self.password)
                        
                    })
                    {
                        
                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                            
                            ZStack(alignment: /*@START_MENU_TOKEN@*/Alignment(horizontal: .center, vertical: .center)/*@END_MENU_TOKEN@*/, content: {
                                Rectangle()
                                    .frame(width: 327.0, height: 60.0).cornerRadius(10).foregroundColor(Color("dirtblue"))
                                
                                Text("Sign Up").bold().foregroundColor(Color.white.opacity(0.8))
                            }).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                            
                        })
                        
                    }.padding(.top,60)
                    
                    Text("or connect").foregroundColor(.gray)
                    
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
                                        }).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ ).border(Color("dirtblue")).cornerRadius(9)
                                        
                                    })
                                    .padding()
                                })
                        }.padding(0)
                    }
                    Spacer()
                    HStack{
                        Text("Have an Account?").foregroundColor(.gray)
                        Button(action:{
                            
                            
                        })
                        {
                            NavigationLink(
                                destination: Login()
                                    .navigationBarHidden(true),
                                label: {
                                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                        
                                        Text("Sign in").foregroundColor(.black)
                                        
                                    })
                                    .padding(0)
                                })
                        }
                        
                    }.padding(.bottom,20)
                    
                    
                }
            }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
    }
    }
}


struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
