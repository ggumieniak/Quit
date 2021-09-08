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
    
    func get(predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?) -> Result<[T], Error> {
        let fetchRequest = Entity.fetchRequest()
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sortDescriptors
        do {
            return .failure(CoreDataRepositoryError.notImplemented)
        } catch {
            return .failure(error)
        }
    }
    
    func add(_ entity: T) -> Result<T, Error> { .failure(CoreDataRepositoryError.notImplemented)}
    
    func put(_ entity: T) -> Result<T, Error> { .failure(CoreDataRepositoryError.notImplemented)}
    
    func delete(entity: T) -> Result<Bool, Error> { .failure(CoreDataRepositoryError.notImplemented)}
    

}
