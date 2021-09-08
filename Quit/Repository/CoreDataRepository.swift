//
//  CoreDataRepository.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 07/09/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataRepositoryError: Error {
    case invalidManagedObjectType
}

class CoreDataRepository<T: NSManagedObject>: Repository {

    typealias Entity = T
    
    private let managedObjectContext: NSManagedObjectContext
    
    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }
    
    func get() -> Result<[T], Error> {
        let className = String(describing: Entity.self)
        guard let managedObject = NSEntityDescription.insertNewObject(forEntityName: className, into: managedObjectContext) as? Entity else {
            return .failure(CoreDataRepositoryError.invalidManagedObjectType)
        }
    }
    
    func add(_ entity: T) -> Result<T, Error> {
        <#code#>
    }
    
    func put(_ entity: T) -> Result<T, Error> {
        <#code#>
    }
    
    func delete(entity: T) -> Result<Bool, Error> {
        <#code#>
    }
    

}
