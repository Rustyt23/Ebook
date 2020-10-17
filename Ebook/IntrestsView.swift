//
//  IntersetsView.swift
//  Ebook
//
//  Created by Rustyt Rooser on 28/09/20.
//

import SwiftUI

struct IntrestsView: View {
  @State  var tick:Bool = false
    var body: some View{
        VStack(alignment:.leading){
            back()
            Text("Choose Interests")
                .font(.largeTitle)
                .fontWeight(.bold).padding(10)
            Text("Which types of book are you intrested in?").frame(width:(UIScreen.main.bounds.width)*0.75,alignment: .leading).padding(.leading,10).foregroundColor(.gray)
            HStack{
                VStack{
                    ZStack(alignment:.topTrailing){
                        Button(action: {
                                    self.tick.toggle()
                                }) {
                        Image("photography").resizable().frame(width: (UIScreen.main.bounds.width)*0.28, height: (UIScreen.main.bounds.width)*0.3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(10).padding(.leading,10)
                        }
                        Circle().frame(width: 15, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(self.tick != false ? .green : .white).padding(6)
                        
                        Image(systemName: "pin.fill").resizable().frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(.white).padding(8)
                       
                    }
                    Text("Photography").padding(0)
                }
            }
            
            
            Spacer()
        }
    }
}

struct IntrsetsView_Previews: PreviewProvider {
    static var previews: some View {
        IntrestsView()
    }
}
