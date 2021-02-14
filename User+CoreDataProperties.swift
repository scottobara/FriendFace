//
//  User+CoreDataProperties.swift
//  FriendFace
//
//  Created by Scott Obara on 14/2/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: Date?
    @NSManaged public var friends: NSSet?
    @NSManaged public var tags: NSSet?
    
    public var wrappedAbout: String {
        about ?? "..."
    }
    public var wrappedAddress: String {
        address ?? "Address not provided"
    }
    public var wrappedAge: Int16 {
        age
    }
    public var wrappedCompany: String {
        company ?? "N/A"
    }
    public var wrappedEmail: String {
        email ?? "Email not provided"
    }
    public var wrappedId: UUID {
        id ?? UUID()
    }
    public var wrappedIsActive: Bool {
        isActive
    }
    public var wrappedName: String {
        name ?? "Unknown"
    }
    public var wrappedRegistered: Date {
        registered ?? Date()
    }
    
    public var friendsArray: [User] {
        let set = friends as? Set<User> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
    
    public var tagsArray: [Tag] {
        let set = tags as? Set<Tag> ?? []
        return set.sorted {
            $0.wrappedTagName < $1.wrappedTagName
        }
    }
    
}

// MARK: Generated accessors for friends
extension User {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: User)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: User)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

// MARK: Generated accessors for tags
extension User {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: Tag)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: Tag)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}

extension User : Identifiable {

}
