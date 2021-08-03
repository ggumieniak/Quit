//
//  AddictionListViewModel.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 07/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation
import SwiftUI

class AddictionListViewModel: ObservableObject {
    @Published var addictions = [Quit]()
    @Published var showView: Quit?
    @Published var isShow: Bool = false
    
    
    func removeAddiction(at offset: IndexSet) {
        addictions.remove(atOffsets: offset)
    }
    
    func fetchData() {
        addictions = Quit.exampleArray
    }
}
