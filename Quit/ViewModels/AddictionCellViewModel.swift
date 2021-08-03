//
//  AddictionCellViewModel.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 07/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation

class AddictionCellViewModel: ObservableObject {
    
    @Published var addiction: Quit
    
    init(_ addiction: Quit) {
        self.addiction = addiction
    }
    
    func getCurrentData() -> String {
        let date = addiction.dateStart
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
}
