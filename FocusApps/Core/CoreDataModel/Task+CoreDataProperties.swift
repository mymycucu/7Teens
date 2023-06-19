//
//  Task+CoreDataProperties.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 19/06/23.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var is_done: Bool
    @NSManaged public var name: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var session: NSSet?

}

// MARK: Generated accessors for session
extension Task {

    @objc(addSessionObject:)
    @NSManaged public func addToSession(_ value: Session)

    @objc(removeSessionObject:)
    @NSManaged public func removeFromSession(_ value: Session)

    @objc(addSession:)
    @NSManaged public func addToSession(_ values: NSSet)

    @objc(removeSession:)
    @NSManaged public func removeFromSession(_ values: NSSet)

}

extension Task : Identifiable {

}
