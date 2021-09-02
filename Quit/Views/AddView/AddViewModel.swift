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
    
    init(quit: Quit.Data = Quit.Data()) {
        self.quit = quit
    }
}
