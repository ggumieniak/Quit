//
//  MainViewModel.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 07/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    @Published var quits: [Quit] = []
    @Published var detailedQuit: Quit?
    @Published var isShow: Bool = false
    
    
    func addQuit(_ quit: Quit) {
        quits.append(quit)
    }
    
    func removeQuit(at offset: IndexSet) {
        quits.remove(atOffsets: offset)
    }
    
    func fetchData() {
        quits = Quit.mockQuitArray
    }
}
