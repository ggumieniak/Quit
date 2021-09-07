//
//  Quits+CoreDataProperties.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 07/09/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//
//

import Foundation
import CoreData


extension Quits {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Quits> {
        return NSFetchRequest<Quits>(entityName: "Quits")
    }

    @NSManaged public var ammount: Double
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var qDescription: String?
    @NSManaged public var title: String?

}

extension Quits : Identifiable {

}
