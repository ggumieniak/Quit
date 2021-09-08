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
    
    func get() -> Result<[Entity],Error>
    func add(_ entity: Entity) -> Result<Entity,Error>
    func put(_ entity: Entity) -> Result<Entity,Error>
    func delete(entity: Entity) -> Result<Bool,Error>
}
