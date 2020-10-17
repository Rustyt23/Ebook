import SwiftUI

struct Welcomes: Codable {
    let status: Bool
    let message: [Messages]
}

// MARK: - Message
struct Messages: Codable {
    let Genre:String
    let Title: String
    let Desc: String
    let PUBLISHED: Int
  //  let PAGES: Int
    let Cover: String
     //  let Author: [Authed]
       
       
       
   }


   struct Authe: Codable {
       let Name: String
           let Rating: Int
   }








struct com: View{
    @State private var messages = [Messages]()
    @State private var auth = [Authe]()
    var body: some View{
        
       
            List(messages, id:\.PUBLISHED)
            { s in
        VStack{
            
             
                Text(s.Title)
            
                
            }
        
       
        }.onAppear(perform: {
            load()
                  
              
          })
        
    }
    func load() -> Void {
        
       
        
        guard let url = URL(string:"http://143.110.185.192:5000/api/bookDetails/5f705ac246e5665594dceae0")
        else
        {
        print("Error")
        return
        }
        let request =  URLRequest(url: url)
        URLSession.shared.dataTask(with: request){ data , response , error in
         
            if let date = data {
                if let json = try? JSONDecoder().decode(Welcomes.self, from: date)            {
                DispatchQueue.main.async {
                    self.messages = json.message
                  
                    
                }
                    return
            }
        }
            
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        
        }.resume()
}
}

struct conm: PreviewProvider{
    
    static  var previews: some View{
    com()
    }
}

