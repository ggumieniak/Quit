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
    
    private let addNewQuit: (Quit)->()
    
    init(at addNewQuit: @escaping (Quit)->()) {
        self.addNewQuit = addNewQuit
    }
    
    func addQuit() {
        let quit = Quit(id: UUID.init(), name: title, description: description, dateStart: date,ammount: Double(ammount)!)
        addNewQuit(quit)
        clearInput()
    }
    
    private func clearInput() {
        title = ""
        description = ""
        ammount = ""
        date = Date()
    }
}
