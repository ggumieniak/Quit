//
//  UnitOfWork.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 08/09/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation
import CoreData

enum UnitOfWorkError: Error {
    case UnableToSave
}

class UnitOfWork {
    private let context: NSManagedObjectContext
    let quitRepository: QuitRepository
    
    init(context: NSManagedObjectContext) {
        self.context = context
        self.quitRepository = QuitRepository(context: context)
    }
    
    @discardableResult func saveChanges() -> Result<Bool, Error> {
        do {
            try context.save()
            return .success(true)
        } catch {
            context.rollback()
            return .failure(UnitOfWorkError.UnableToSave)
        }
    }
}
