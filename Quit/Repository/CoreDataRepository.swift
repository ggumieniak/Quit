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
    case notImplemented
}

class CoreDataRepository<T: NSManagedObject>: Repository {

    typealias Entity = T
    
    private let managedObjectContext: NSManagedObjectContext
    
    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }
    
    func get(predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?) -> Result<[Entity], Error> {
        let fetchRequest = Entity.fetchRequest()
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sortDescriptors
        do {
            if let fetchResults = try managedObjectContext.fetch(fetchRequest) as? [Entity] {
                return .success(fetchResults)
            } else {
                return .failure(CoreDataRepositoryError.invalidManagedObjectType)
            }
        } catch {
            return .failure(error)
        }
    }
    
    func create() -> Result<Entity, Error> {
        let className = String(describing: Entity.self)
        guard let managedObject = NSEntityDescription.insertNewObject(forEntityName: className, into: managedObjectContext) as? Entity else {
            return .failure(CoreDataRepositoryError.invalidManagedObjectType)
        }
        return .success(managedObject)
    }
    
    func update(_ entity: Entity) -> Result<Entity, Error> { .failure(CoreDataRepositoryError.notImplemented)}
    
    func delete(entity: Entity) -> Result<Bool, Error> { .failure(CoreDataRepositoryError.notImplemented)}
    

}
