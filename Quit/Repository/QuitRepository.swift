//
//  QuitRepository.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 08/09/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation
import CoreData

enum QuitRepositoryError: Error {
    case unableToCreateAnDomainObject
    case unableToAccessObjectFromDBContext
    case notFindedSpecificEntityInCoreData
    case notImplemented
}

protocol QuitRepositoryProtocol {
    func getQuits(predicate: NSPredicate?) -> Result<[Quit], Error>
    func create(quit: Quit) -> Result<Bool, Error>
    func update(quit: Quit) -> Result<Bool, Error>
    func delete(quit: Quit) -> Result<Bool, Error>
}

class QuitRepository {
    private let repository: CoreDataRepository<Quits>
    
    init(context: NSManagedObjectContext) {
        self.repository = CoreDataRepository<Quits>(managedObjectContext: context)
    }
}

extension QuitRepository: QuitRepositoryProtocol {
    @discardableResult func getQuits(predicate: NSPredicate?) -> Result<[Quit], Error> {
        let result = repository.get(predicate: predicate, sortDescriptors: nil)
        switch result {
            case .success(let quitsMO):
                let quits = quitsMO.map { quitMO -> Quit in
                    return Quit(id: quitMO.id, title: quitMO.title, description: quitMO.qDescription, dateStart: quitMO.date, ammount: quitMO.ammount)
                }
                return .success(quits)
        case .failure:
            return .failure(QuitRepositoryError.unableToAccessObjectFromDBContext)
        }
    }
    
    @discardableResult func create(quit: Quit) -> Result<Bool, Error> {
        let result = repository.create()
        switch result {
        case .success(let quitMO):
            quitMO.ammount = quit.ammount
            quitMO.id = quit.id
            quitMO.qDescription = quit.description
            quitMO.date = quit.date
            quitMO.title = quit.title
            return .success(true)
        case .failure:
            return .failure(QuitRepositoryError.unableToCreateAnDomainObject)
        }
    }
    
    @discardableResult func update(quit: Quit) -> Result<Bool, Error> {
        guard let entity = repository.getSpecificEntityById(id: quit.id) else {
            return .failure(QuitRepositoryError.notFindedSpecificEntityInCoreData)
        }
        entity.ammount = quit.ammount
        entity.date = quit.date
        entity.id = quit.id
        entity.qDescription = quit.description
        entity.title = quit.title
        let item = repository.update(entity)
        switch item {
        case .success(let quitMO):
            if entity == quitMO {
                return .success(true)
            } else {
                return .failure(QuitRepositoryError.notFindedSpecificEntityInCoreData)
            }
        case .failure(let error):
            return .failure(error)
        }
        
    }
    
    @discardableResult func delete(quit: Quit) -> Result<Bool, Error> {
        guard let entity = repository.getSpecificEntityById(id: quit.id) else {
            return .failure(QuitRepositoryError.notFindedSpecificEntityInCoreData)
        }
        return repository.delete(entity: entity)
    }
    
}
