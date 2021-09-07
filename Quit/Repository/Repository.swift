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
    associatedtype T
    
    func get(id: Int, completionHandler: (T?,Error) -> Void)
    func list(completionHandler: ([T]?, Error) -> Void)
    func add(_ item: T, completionHandler: (Error?) -> Void)
    func edit(_ item: T, completionHandler: (Error?) -> Void)
}
protocol CombineRepository {
    associatedtype T
    
    func get(id: Int) -> AnyPublisher<T, Error>
    func list() -> AnyPublisher<[T], Error>
    func add(_ item: T) -> AnyPublisher<Void, Error>
    func delete(_ item: T) -> AnyPublisher<Void, Error>
    func edit(_ item: T) -> AnyPublisher<Void, Error>
}
