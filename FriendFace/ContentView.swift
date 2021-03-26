//
//  ContentView.swift
//  UsersAndFriends
//
//  Created by Scott Obara on 13/2/21.
//

import SwiftUI
import CoreData

//struct Response: Codable {
//    var results: [Result]
//}

struct UserStruct: Codable {
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [FriendStruct]
}

struct FriendStruct: Codable {
    var id: UUID
    var name: String
}

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User.id, ascending: true)],
        animation: .default)
    private var users: FetchedResults<User>
    
//    @State private var dataLoaded = UserDefaults.standard.bool(forKey: "Loaded")
    @State private var usersStruct = [UserStruct]()
    @AppStorage("dataLoaded") var dataLoaded = false
    
    var body: some View {
        
        NavigationView {
            
            List(usersStruct, id: \.id) { user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    VStack(alignment: .leading) {
                        Text(user.name ?? "UNKNOWN")
                            .font(.headline)
                        Text(user.email ?? "UNKNOWN")
                    }
                }
            }
//            List {
//                ForEach(users, id: \.id) { user in
//                    Section(header: Text(user.wrappedName)) {
//                        ForEach(user.friendsArray, id: \.id) { friend in
//                            Text(friend.wrappedName)
//                        }
//                    }
//                }
//            }
            .onAppear(perform: loadData)
            .navigationTitle("FriendFace")
        }
    }
    
    func loadData() {
        dataLoaded = false
        print("\(dataLoaded)")
        
        if (dataLoaded == true) {
            return
        } else {
            //    1. Creating the URL we want to read.
            //    2. Wrapping that in a URLRequest, which allows us to configure how the URL should be accessed.
            //    3. Create and start a networking task from that URL request.
            //    4. Handle the result of that networking task.
            
            guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
                print("Invalid URL")
                return
            }
            
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                
                if let data = data {
                    //https://www.hackingwithswift.com/example-code/language/how-to-use-iso-8601-dates-with-jsondecoder-and-codable
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                    if let decodedResponse = try? decoder.decode([UserStruct].self, from: data) {
                        // we have good data – go back to the main thread
                        DispatchQueue.main.async {
                            // update our UI
                            self.usersStruct = decodedResponse
                        }
                        // everything is good, so we can exit
                        return
                    }
                }
                // if we're still here it means there was a problem
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
                
            }.resume()
            
        }
        
        dataLoaded = true
        print("\(UserDefaults.standard.bool(forKey: "Loaded"))")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


