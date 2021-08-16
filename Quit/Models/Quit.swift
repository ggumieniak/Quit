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
    var description: String { get }
    var duration: Double { get }
    var dateStart: Date { get }
    var ammount: Decimal { get }
}

struct Quit: QuitType {
    var id: Int
    var name: String
    var duration: Double {
        let now = Date()
        let duration =  (now.timeIntervalSince1970 - dateStart.timeIntervalSince1970)/60/60/24
        print(duration)
        return duration
    }
    var description: String
    var dateStart: Date
    var ammount: Decimal
    
}

extension Quit {
    static var exampleArray: [Quit] {
        var addictions = [Quit]()
        let yesterday = Calendar.current.date(byAdding: .day,value: -1, to: Date())!
        addictions.append(Quit(id: 1,name: "Papierosy", description: "", dateStart: yesterday, ammount: 15.50))
        addictions.append(Quit(id: 2,name: "Alkohol", description: "", dateStart: yesterday - 1, ammount: 32.12))
        addictions.append(Quit(id: 3,name: "Zielsko", description: "", dateStart: yesterday - 3, ammount: 40.00))
        addictions.append(Quit(id: 4,name: "Kofeina", description: "", dateStart: yesterday - 4, ammount: 6.63))
        addictions.append(Quit(id: 5,name: "Kokaina", description: "", dateStart: yesterday + 1, ammount: 160))
        addictions.append(Quit(id: 6,name: "Woda", description: "", dateStart: yesterday + 2, ammount: 0.70))
        addictions.append(Quit(id: 7,name: "Mleko", description: "", dateStart: yesterday + 4, ammount: 2.29))
        addictions.append(Quit(id: 8,name: "Kamień", description: "", dateStart: yesterday + 123, ammount: 0.01))
        addictions.append(Quit(id: 9,name: "Makaron", description: "", dateStart: yesterday + 123123, ammount: 5.53))
        addictions.append(Quit(id: 10,name: "Powietrze", description: "", dateStart: yesterday, ammount: 9999.12))
        addictions.append(Quit(id: 11,name: "Bednarz Bednarz Bednarz Bednarz Bednarz Bednarz ", description: "", dateStart: yesterday, ammount: 999999999.30))
        return addictions
    }
    static var example: Quit {
        let yesterday = Calendar.current.date(byAdding: .day,value: -1, to: Date())!
        return Quit(id: 6,name: "Woda", description: "Wodnista woda nie bede jej nigdy pil", dateStart: yesterday + 2, ammount: 7012.42)
    }
}
