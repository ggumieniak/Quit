//
//  AddViewModel.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 05/08/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation

class AddViewModel: ObservableObject {
    @Published var title = ""
    @Published var description = ""
    @Published var date = Date()
    @Published var ammount = ""
}
