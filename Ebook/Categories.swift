
import SwiftUI

struct types: Identifiable {
    var id = UUID()
    var imagename: String
    var type: String
    var count: Int
    
}

let type = [types(imagename: "art", type: "Arts", count: 424),types(imagename: "bio", type: "Biography", count: 423),types(imagename: "business2", type: "Business", count: 24),types(imagename: "photography", type: "Photography", count: 564),types(imagename: "classic", type: "Classic", count: 222),types(imagename: "drama", type: "Drama", count: 233),types(imagename: "history", type: "History", count: 345)]

struct cat: View {
    
    var body: some View{
        VStack{
            HStack{
                back()
                
            }
            HStack{
                
                Text("Categories").font(.largeTitle).fontWeight(.bold).multilineTextAlignment(.leading).padding([.leading]).scaledToFill().shadow(radius: 2 )
            Spacer()
            }
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


struct ContentViews_Previews : PreviewProvider {
    static var previews: some View {
       cat()
    }
}
