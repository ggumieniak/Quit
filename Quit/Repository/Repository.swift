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
    
    func get(id: Int, completionHandler: (Entity?,Error) -> Void)
    func list(completionHandler: ([Entity]?, Error) -> Void)
    func add(_ item: Entity, completionHandler: (Error?) -> Void)
    func edit(_ item: Entity, completionHandler: (Error?) -> Void)
}
protocol CombineRepository {
    associatedtype Entity
    
    func get(id: Int) -> AnyPublisher<Entity, Error>
    func list() -> AnyPublisher<[Entity], Error>
    func add(_ item: Entity) -> AnyPublisher<Void, Error>
    func delete(_ item: Entity) -> AnyPublisher<Void, Error>
    func edit(_ item: Entity) -> AnyPublisher<Void, Error>
}
