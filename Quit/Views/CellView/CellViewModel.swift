//
//  CellViewModel.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 07/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation

class CellViewModel: ObservableObject {
    
    private let quit: Quit
    @Published var ammount: String
    @Published var date: String
    @Published var description: String
    @Published var name: String
    @Published var duration: String

    init(_ addiction: Quit) {
        self.quit = addiction
        self.ammount = String(format: "%.2f", quit.ammount * quit.duration)
        self.description = quit.description
        self.name = quit.name
        self.date = quit.dateStart.toString()
        self.duration = String(format: "%.0f", quit.duration)
    }
}
