//
//  Repository.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 07/09/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation
import Combine

protocol Repository {
    associatedtype Entity
    
    func get(predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?) -> Result<[Entity],Error>
    func create() -> Result<Entity,Error>
    func update(_ entity: Entity) -> Result<Entity,Error>
    func delete(entity: Entity) -> Result<Bool,Error>
}
