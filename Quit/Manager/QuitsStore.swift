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
        quits = getQuits()
    }
    
    private func getQuits() -> [Quit] {
        let result = unitOfWork.quitRepository.getQuits(predicate: nil)
        switch result {
        case .success(let array):
            return array
        case .failure(let error):
            print(error)
            return []
        }
    }
    
    func addQuit(quit: Quit) {
        quits.append(quit)
        unitOfWork.quitRepository.create(quit: quit)
        unitOfWork.saveChanges()
    }
}
