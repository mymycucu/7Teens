//
//  Session+CoreDataProperties.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 19/06/23.
//
//

import Foundation
import CoreData


extension Session {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Session> {
        return NSFetchRequest<Session>(entityName: "Session")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var task: Task?
    @NSManaged public var activity: NSSet?

}

// MARK: Generated accessors for activity
extension Session {

    @objc(addActivityObject:)
    @NSManaged public func addToActivity(_ value: SessionActivity)

    @objc(removeActivityObject:)
    @NSManaged public func removeFromActivity(_ value: SessionActivity)

    @objc(addActivity:)
    @NSManaged public func addToActivity(_ values: NSSet)

    @objc(removeActivity:)
    @NSManaged public func removeFromActivity(_ values: NSSet)

}

extension Session : Identifiable {

}
