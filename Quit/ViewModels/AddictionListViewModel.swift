//
//  AddictionListViewModel.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 07/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation

class AddictionListViewModel: ObservableObject {
    @Published private var addictionList = [Addiction]()
    
}
