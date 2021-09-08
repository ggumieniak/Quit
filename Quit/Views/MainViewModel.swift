//
//  MainViewModel.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 07/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData

class MainViewModel: ObservableObject {
    @Published var quits: [Quit] = []
    @Published var detailedQuit: Quit?
    @Published var isShow: Bool = false
    
    private let unitOfWork: UnitOfWork
    
    init(context: NSManagedObjectContext) {
        unitOfWork = UnitOfWork(context: context)
    }
    
    func addQuit(_ quit: Quit) {
        quits.append(quit)
    }
    
    func removeQuit(at offset: IndexSet) {
        quits.remove(atOffsets: offset)
    }
    
    func fetchData() {
        let result = unitOfWork.quitRepository.getQuits(predicate: nil)
        switch result {
        case .success(let array):
            quits = array
        case .failure(let error):
            quits = []
            print(error)
        }
    }
}
