//
//  ForgotPaaswordView.swift
//  Ebook
//
//  Created by Rustyt Rooser on 28/09/20.
//

import SwiftUI

struct ForgotPaaswordView: View {
    @State var email: String=""

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView{
       
        VStack(alignment: .center) {
            HStack{
                VStack{
                    ZStack {
                        Button(action: {
                           self.presentationMode.wrappedValue.dismiss()
                        }) {
                            back().foregroundColor(.black).offset(y:10)
                        }.navigationBarHidden(true)
                        Text("Forgot Password").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(.top,20)
                        
                      
                        Spacer()
                    }
                    
                
                   Divider()
                    
                }
                
               
                Spacer()
            
            }
        
            
            Text("Enter your email and will send  you instruction on how to reset it").multilineTextAlignment(.center).padding(50)
           Divider()
            HStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                Text("Email").padding(.leading, 49.0)
                TextField("     Enter your email",text: $email)
               
            })
            Divider()
            button(label: "Send")                    
            
        }
        .padding([.top, .leading, .bottom])
        .frame(width: 400, height: .greatestFiniteMagnitude)
    }
        
        
        
        
        
        }
}

struct ForgotPaaswordView_Previews: PreviewProvider {
    static var previews: some View {
       
        Group {
            ForgotPaaswordView()
        }
}
}
