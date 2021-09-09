//
//  QuitsStore.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 09/09/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation
import Combine
import CoreData

class QuitsStore: ObservableObject {
    @Published var quits: [Quit] = []
    let unitOfWork: UnitOfWork
    init(context: NSManagedObjectContext) {
        unitOfWork = UnitOfWork(context: context)
    }
}
