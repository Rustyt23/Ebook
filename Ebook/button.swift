//
//  button.swift
//  Ebook
//
//  Created by Rustyt Rooser on 30/09/20.
//

import SwiftUI

struct button: View {
    @State var color:String = "dirtblue"
    @State var tcolor:String = ".white"
    var label:String
    var body: some View {
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
                        .frame(width: 327.0, height: 60.0).cornerRadius(10).foregroundColor(Color(color)//
                                                               )                                 //.opacity(0.9))
                    Text(label).bold().foregroundColor(Color.white.opacity(0.8))
                }).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                
            })
            .padding()
            })
        }
    }
}

struct RemoteImage: View {
    private enum LoadState {
        case loading, success, failure
    }

    private class Loader: ObservableObject {
        var data = Data()
        var state = LoadState.loading

        init(url: String) {
            guard let parsedURL = URL(string: url) else {
                fatalError("Invalid URL: \(url)")
            }

            URLSession.shared.dataTask(with: parsedURL) { data, response, error in
                if let data = data, data.count > 0 {
                    self.data = data
                    self.state = .success
                } else {
                    self.state = .failure
                }

                DispatchQueue.main.async {
                    self.objectWillChange.send()
                }
            }.resume()
        }
    }

    @StateObject private var loader: Loader
    var loading: Image
    var failure: Image

    var body: some View {
        selectImage()
            .resizable()
    }

    init(url: String, loading: Image = Image(systemName: "photo"), failure: Image = Image(systemName: "multiply.circle")) {
        _loader = StateObject(wrappedValue: Loader(url: url))
        self.loading = loading
        self.failure = failure
    }

    private func selectImage() -> Image {
        switch loader.state {
        case .loading:
            return loading
        case .failure:
            return failure
        default:
            if let image = UIImage(data: loader.data) {
                return Image(uiImage: image)
            } else {
                return failure
            }
        }
    }
}


struct back: View {
    var body: some View {
        
        HStack{
            Image(systemName:"chevron.left").multilineTextAlignment(.leading).shadow(radius: 4 ).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(.leading,8)
        Spacer()
        }
    }
}

struct  seeall: View {
    var text:String="set"
    var body: some View{
        HStack{
            Text(text)
                .font(.title2)
                    .fontWeight(.semibold)
            Spacer()
            Text("See all")
                .font(.caption).foregroundColor(.gray)
            forward()
        }.padding(.horizontal)
    }

}

struct forward: View {
    var body: some View{
        Image(systemName: "chevron.right").foregroundColor(.gray).padding(.trailing, 0.0)
    }
}

struct button_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            
            back()
            button(label: "send")
            seeall()
 
           
           
        }
    }
}
