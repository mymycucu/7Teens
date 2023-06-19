//
//  SessionActivity+CoreDataProperties.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 19/06/23.
//
//

import Foundation
import CoreData


extension SessionActivity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SessionActivity> {
        return NSFetchRequest<SessionActivity>(entityName: "SessionActivity")
    }

    @NSManaged public var duration: Int32
    @NSManaged public var createdAt: Date?
    @NSManaged public var activity: Bool
    @NSManaged public var session: Session?

}

extension SessionActivity : Identifiable {

}
