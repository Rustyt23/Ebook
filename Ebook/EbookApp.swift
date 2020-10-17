import SwiftUI



@main
struct EbookApp: App {
    @StateObject var manager = Login_service()
    var body: some Scene {
        WindowGroup {
            //         BookDetail()
            Login()
//                        ContentView()
        }
    }
}

struct EbookApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
