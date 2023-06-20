//
//  TaskMO+CoreDataProperties.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 20/06/23.
//
//

import Foundation
import CoreData


extension TaskMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskMO> {
        return NSFetchRequest<TaskMO>(entityName: "TaskMO")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var is_done: Bool
    @NSManaged public var name: String?
    @NSManaged public var session: NSOrderedSet?

}

// MARK: Generated accessors for session
extension TaskMO {

    @objc(insertObject:inSessionAtIndex:)
    @NSManaged public func insertIntoSession(_ value: SessionMO, at idx: Int)

    @objc(removeObjectFromSessionAtIndex:)
    @NSManaged public func removeFromSession(at idx: Int)

    @objc(insertSession:atIndexes:)
    @NSManaged public func insertIntoSession(_ values: [SessionMO], at indexes: NSIndexSet)

    @objc(removeSessionAtIndexes:)
    @NSManaged public func removeFromSession(at indexes: NSIndexSet)

    @objc(replaceObjectInSessionAtIndex:withObject:)
    @NSManaged public func replaceSession(at idx: Int, with value: SessionMO)

    @objc(replaceSessionAtIndexes:withSession:)
    @NSManaged public func replaceSession(at indexes: NSIndexSet, with values: [SessionMO])

    @objc(addSessionObject:)
    @NSManaged public func addToSession(_ value: SessionMO)

    @objc(removeSessionObject:)
    @NSManaged public func removeFromSession(_ value: SessionMO)

    @objc(addSession:)
    @NSManaged public func addToSession(_ values: NSOrderedSet)

    @objc(removeSession:)
    @NSManaged public func removeFromSession(_ values: NSOrderedSet)

}

extension TaskMO : Identifiable {

}
