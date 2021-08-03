//
//  Addiction.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 07/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation

protocol QuitType: Identifiable {
    var id: Int { get }
    var name: String { get }
    var duration: Int { get }
    var dateStart: Date { get }
}

struct Quit: QuitType {
    var id: Int
    var name: String
    var duration: Int {
        let now = Date()
        let duration =  (now.timeIntervalSince1970 - dateStart.timeIntervalSince1970)/60/60/24
        return Int(duration)
    }
    var dateStart: Date
    
}

extension Quit {
    static var exampleArray: [Quit] {
        var addictions = [Quit]()
        let yesterday = Calendar.current.date(byAdding: .day,value: -1, to: Date())!
        addictions.append(Quit(id: 1,name: "Papierosy", dateStart: yesterday))
        addictions.append(Quit(id: 2,name: "Alkohol", dateStart: yesterday - 1))
        addictions.append(Quit(id: 3,name: "Zielsko", dateStart: yesterday - 3))
        addictions.append(Quit(id: 4,name: "Kofeina", dateStart: yesterday - 4))
        addictions.append(Quit(id: 5,name: "Kokaina", dateStart: yesterday + 1))
        addictions.append(Quit(id: 6,name: "Woda", dateStart: yesterday + 2))
        addictions.append(Quit(id: 7,name: "Mleko", dateStart: yesterday + 4))
        addictions.append(Quit(id: 8,name: "Kamień", dateStart: yesterday + 123))
        addictions.append(Quit(id: 9,name: "Makaron", dateStart: yesterday + 123123))
        addictions.append(Quit(id: 10,name: "Powietrze", dateStart: yesterday))
        addictions.append(Quit(id: 10,name: "Bednarz Bednarz Bednarz Bednarz Bednarz Bednarz ", dateStart: yesterday))
        return addictions
    }
    static var example: Quit {
        let yesterday = Calendar.current.date(byAdding: .day,value: -1, to: Date())!
        return Quit(id: 6,name: "Woda", dateStart: yesterday + 2)
    }
}
