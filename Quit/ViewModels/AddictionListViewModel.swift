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
    @Published var addictions = [Addiction]()
    @Published var showView: Addiction?
    @Published var isShow: Bool = false
    
    
    func removeAddiction(at offset: IndexSet) {
        addictions.remove(atOffsets: offset)
    }
    
    func createExampleAddictions() {
        let yesterday = Calendar.current.date(byAdding: .day,value: -1, to: Date())!
        addictions.append(Addiction(id: 1,name: "Papierosy", dateStart: yesterday))
        addictions.append(Addiction(id: 2,name: "Alkohol", dateStart: yesterday))
        addictions.append(Addiction(id: 3,name: "Zielsko", dateStart: yesterday))
        addictions.append(Addiction(id: 4,name: "Kofeina", dateStart: yesterday))
        addictions.append(Addiction(id: 5,name: "Kokaina", dateStart: yesterday))
        addictions.append(Addiction(id: 6,name: "Woda", dateStart: yesterday))
        addictions.append(Addiction(id: 7,name: "Mleko", dateStart: yesterday))
        addictions.append(Addiction(id: 8,name: "Kamień", dateStart: yesterday))
        addictions.append(Addiction(id: 9,name: "Makaron", dateStart: yesterday))
        addictions.append(Addiction(id: 10,name: "Powietrze", dateStart: yesterday))
        addictions.append(Addiction(id: 10,name: "Bednarz Bednarz Bednarz Bednarz Bednarz Bednarz ", dateStart: yesterday))
    }
}
