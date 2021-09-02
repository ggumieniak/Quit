//
//  AddViewModel.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 05/08/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation

class AddViewModel: ObservableObject {
    @Published var quit: Quit.Data = Quit.Data()
    
    init(quit: Quit) {
        self.quit.title = quit.title
        self.quit.description = quit.description
        self.quit.date = quit.date
        self.quit.ammount = String(quit.ammount)
    }
    init(quit: Quit.Data = Quit.Data()) {
        self.quit = quit
    }
}
