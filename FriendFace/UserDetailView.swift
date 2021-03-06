//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Scott Obara on 14/2/21.
//

import SwiftUI

struct UserDetailView: View {
    
//    struct User: Codable {
//        var id: UUID
//        var isActive: Bool
//        var name: String
//        var age: Int
//        var company: String
//        var email: String
//        var address: String
//        var about: String
//        var registered: Date
//        var tags: [String]
//        var friends: [Friend]
//    }
    
    let user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text(user.name)
                .font(.headline)
            Text(user.about)
            Text("Friends")
                .font(.headline)
            ForEach(user.friends, id: \.id) { friend in
                Text(friend.name)
            }
            Spacer()
        }
        .padding()
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: User(id: UUID(), isActive: false, name: "Alford Rodriguez", age: 21, company: "Imkan", email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered: Date(), tags: ["tag1", "tag2", "tag3"], friends: [Friend(id: UUID(), name: "Hawkins Patel"), Friend(id: UUID(), name: "Jewel Sexton"), Friend(id: UUID(), name: "Berger Robertson"), Friend(id: UUID(), name: "Hess Ford"), Friend(id: UUID(), name: "Bonita White"), Friend(id: UUID(), name: "Sheryl Robinson"), Friend(id: UUID(), name: "Karin Collins"), Friend(id: UUID(), name: "Pace English"), Friend(id: UUID(), name: "Pauline Dawson"), Friend(id: UUID(), name: "Russo Carlson"), Friend(id: UUID(), name: "Josefina Rivas")]))
    }
}

