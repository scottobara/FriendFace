//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Scott Obara on 14/2/21.
//

import SwiftUI

struct UserDetailView: View {
    
    let user: UserStruct
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 10.0) {
                Text(user.name)
                    .font(.headline)
                Text(user.about)
                    //.layoutPriority(1)
                Text("Friends")
                    .font(.headline)
                    .padding(.top)
                ForEach(user.friends, id: \.id) { friend in
                    Text(friend.name)
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: UserStruct(id: UUID(), isActive: false, name: "Alford Rodriguez", age: 21, company: "Imkan", email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered: Date(), tags: ["tag1", "tag2", "tag3"], friends: [FriendStruct(id: UUID(), name: "Hawkins Patel"), FriendStruct(id: UUID(), name: "Jewel Sexton"), FriendStruct(id: UUID(), name: "Berger Robertson"), FriendStruct(id: UUID(), name: "Hess Ford"), FriendStruct(id: UUID(), name: "Bonita White"), FriendStruct(id: UUID(), name: "Sheryl Robinson"), FriendStruct(id: UUID(), name: "Karin Collins"), FriendStruct(id: UUID(), name: "Pace English"), FriendStruct(id: UUID(), name: "Pauline Dawson"), FriendStruct(id: UUID(), name: "Russo Carlson"), FriendStruct(id: UUID(), name: "Josefina Rivas")]))
    }
}

