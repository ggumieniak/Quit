//
//  CoreDataRepository.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 07/09/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation

class CoreDataRepository: Repository {
    typealias T = Quit
    func get(id: Int, completionHandler: (Quit?, Error) -> Void) {
        
    }
    
    func list(completionHandler: ([Quit]?, Error) -> Void) {}
    
    func add(_ item: Quit, completionHandler: (Error?) -> Void) {}
    
    func edit(_ item: Quit, completionHandler: (Error?) -> Void) {}
}
