//
//  Task+CoreDataProperties.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 20.10.2021.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var deadline: Date?
    @NSManaged public var detail: String?
    @NSManaged public var title: String?
    @NSManaged public var uuid: UUID?

}

extension Task : Identifiable {

}
