//
//  SessionActivityMO+CoreDataProperties.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 20/06/23.
//
//

import Foundation
import CoreData


extension SessionActivityMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SessionActivityMO> {
        return NSFetchRequest<SessionActivityMO>(entityName: "SessionActivityMO")
    }

    @NSManaged public var activity: Bool
    @NSManaged public var createdAt: Date?
    @NSManaged public var duration: Int32
    @NSManaged public var session: SessionMO?

}

extension SessionActivityMO : Identifiable {

}
