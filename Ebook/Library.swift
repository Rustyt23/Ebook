//
//  Library.swift
//  Ebook
//
//  Created by Rustyt Rooser on 07/10/20.
//

import SwiftUI

struct Library: View {
    @State var status = true
    var body: some View{
        VStack{
            
        HStack{
            Image(systemName: "bell.fill")
            Spacer()
            Image(systemName: "magnifyingglass")
        }.padding(.horizontal)
            Text("My Library")
                .font(.title)
                .fontWeight(.semibold)
            HStack(alignment:.center){
                Spacer()
                Button(action:{ self.status = true
                    
                }){
                    Text("Books").foregroundColor(!self.status ? Color("dirtblue"):.black).fontWeight(self.status ?.bold: .regular)
                }
                Spacer()
                Button(action:{ self.status = false
                    
                }){
                    Text("Purchased").foregroundColor(self.status ? Color("dirtblue"):.black).fontWeight(!self.status ?.bold: .regular)
                }
                Spacer()
            }.padding(.top)
            HStack{
                            
                if self.status{
                    List(type){ s in
                        HStack {
                            Image(s.imagename).resizable().frame(width: 90, height:90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(9)
                            VStack(alignment: .leading) {
                                Text(s.type).fontWeight(.bold).fixedSize().padding(.leading, 2)
                                Text("\(s.count) Books").fontWeight(.light).fixedSize().font(.system(size: 12)).multilineTextAlignment(.leading).padding(/*@START_MENU_TOKEN@*/.all, 4.0/*@END_MENU_TOKEN@*/)
                                
                            }
                            
                        
                        
                            
                        
                            
                        }.padding(2)
                        
                        
                    }
                        }
//                else if !self.status{
                else{
                    List(type){ s in
                        HStack {
                            Image(s.imagename).resizable().frame(width: 90, height:90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(9)
                            VStack(alignment: .leading) {
                                Text(s.type).fontWeight(.bold).fixedSize().padding(.leading, 2)
                                Text("\(s.count) Books").fontWeight(.light).fixedSize().font(.system(size: 12)).multilineTextAlignment(.leading).padding(/*@START_MENU_TOKEN@*/.all, 4.0/*@END_MENU_TOKEN@*/)
                                
                            }
                            
                        
                        
                            
                        
                            
                        }.padding(2)
                        
                        
                    }
                    
                }
                        }
                    }
                }
    }


struct Library_Previews: PreviewProvider {
    static var previews: some View {
        Library()
    }
}
