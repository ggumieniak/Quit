//
//  CoreDataRepository.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 07/09/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation
import CoreData

class CoreDataRepository<T: NSManagedObject>: Repository {
    typealias Entity = T
    
    private let managedObjectContext: NSManagedObjectContext
    
    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }
    
    func get(id: Int, completionHandler: (T?, Error) -> Void) {}
    
    func list(completionHandler: ([T]?, Error) -> Void) {}
    
    func add(_ item: T, completionHandler: (Error?) -> Void) {}
    
    func edit(_ item: T, completionHandler: (Error?) -> Void) {}
    
    
}
