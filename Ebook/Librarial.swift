//
//  Librarial.swift
//  UIKit2Swift
//
//  Created by Rustyt Rooser on 29/09/20.
//

import SwiftUI

struct Librarial: View {
    @State var show:Bool = false
    @State var isActive = false

    var center = (UIScreen.main.bounds.width/2) + 110

    var body: some View {
        
       
        VStack{
            if self.isActive {
                
                Login() .navigationBarHidden(true)
            }
            
            else {
                
                
                
                
                
                
                
                
                ZStack {
                    Color(red: 103/255, green: 117/255, blue: 157/255).opacity(0.9).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                    
                    
                    
                    
                    
                    HStack(content: {
                        Image(systemName: "headphones").resizable().frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("librarial").scaledToFit().font(.system(size: 50))
                    }).colorInvert().scaledToFit().opacity(0.49)
                
                
                
                    HStack(content: {
                        Image(systemName: "headphones").resizable().frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("librarial").scaledToFit().font(.system(size: 50))
                    }).colorInvert().scaledToFit().mask(
                    
                        Capsule().fill(LinearGradient(gradient: Gradient(colors: [.clear,Color.white.opacity(0.49)]), startPoint: .top, endPoint: .bottom))
                            .rotationEffect(.init(degrees: 70))
                            .offset(x: self.show ? center : -center)
                    )
                
                
                
                
                
                
                
                
                
                
                 
                
                
                }.onAppear{
                    
                    withAnimation(Animation.default.speed(0.45).repeatForever(autoreverses: true)){
                        
                        self.show.toggle()
                    }

                }

            }
        }.onAppear {
            // 6.
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                // 7.
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
    
    
}

struct Librarial_Previews: PreviewProvider {
    static var previews: some View {
        Librarial()
    }
}
