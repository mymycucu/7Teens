//
//  SessionMO+CoreDataProperties.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 20/06/23.
//
//

import Foundation
import CoreData


extension SessionMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SessionMO> {
        return NSFetchRequest<SessionMO>(entityName: "SessionMO")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var activity: NSOrderedSet?
    @NSManaged public var task: TaskMO?

}

// MARK: Generated accessors for activity
extension SessionMO {

    @objc(insertObject:inActivityAtIndex:)
    @NSManaged public func insertIntoActivity(_ value: SessionActivityMO, at idx: Int)

    @objc(removeObjectFromActivityAtIndex:)
    @NSManaged public func removeFromActivity(at idx: Int)

    @objc(insertActivity:atIndexes:)
    @NSManaged public func insertIntoActivity(_ values: [SessionActivityMO], at indexes: NSIndexSet)

    @objc(removeActivityAtIndexes:)
    @NSManaged public func removeFromActivity(at indexes: NSIndexSet)

    @objc(replaceObjectInActivityAtIndex:withObject:)
    @NSManaged public func replaceActivity(at idx: Int, with value: SessionActivityMO)

    @objc(replaceActivityAtIndexes:withActivity:)
    @NSManaged public func replaceActivity(at indexes: NSIndexSet, with values: [SessionActivityMO])

    @objc(addActivityObject:)
    @NSManaged public func addToActivity(_ value: SessionActivityMO)

    @objc(removeActivityObject:)
    @NSManaged public func removeFromActivity(_ value: SessionActivityMO)

    @objc(addActivity:)
    @NSManaged public func addToActivity(_ values: NSOrderedSet)

    @objc(removeActivity:)
    @NSManaged public func removeFromActivity(_ values: NSOrderedSet)

}

extension SessionMO : Identifiable {

}
