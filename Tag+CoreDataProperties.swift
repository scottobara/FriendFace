//
//  Tag+CoreDataProperties.swift
//  FriendFace
//
//  Created by Scott Obara on 14/2/21.
//
//

import Foundation
import CoreData


extension Tag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tag> {
        return NSFetchRequest<Tag>(entityName: "Tag")
    }

    @NSManaged public var tagName: String?
    @NSManaged public var users: NSSet?
    
    public var wrappedTagName: String {
        tagName ?? "DEFAULT"
    }

    public var usersArray: [User] {
        let set = users as? Set<User> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
    
}

// MARK: Generated accessors for users
extension Tag {

    @objc(addUsersObject:)
    @NSManaged public func addToUsers(_ value: User)

    @objc(removeUsersObject:)
    @NSManaged public func removeFromUsers(_ value: User)

    @objc(addUsers:)
    @NSManaged public func addToUsers(_ values: NSSet)

    @objc(removeUsers:)
    @NSManaged public func removeFromUsers(_ values: NSSet)

}

extension Tag : Identifiable {

}
