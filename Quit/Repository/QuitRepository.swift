//
//  QuitRepository.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 08/09/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation
import CoreData

protocol QuitRepositoryProtocol {
    func getQuits(predicate: NSPredicate?) -> Result<[Quit], Error>
    func create(quit: Quit) -> Result<Bool, Error>
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
        case .failure(let error):
            return .failure(error)
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
        case .failure(let error):
            return .failure(error)
        }
    }
    
    
}
