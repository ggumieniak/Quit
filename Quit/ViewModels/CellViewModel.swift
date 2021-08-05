//
//  CellViewModel.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 07/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation

class CellViewModel: ObservableObject {
    
    @Published var quit: Quit
    
    init(_ addiction: Quit) {
        self.quit = addiction
    }
    
    func getCurrentData() -> String {
        let date = quit.dateStart
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
}
