//
//  Addiction.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 07/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation

protocol QuitType: Identifiable {
    var id: UUID { get }
    var name: String { get }
    var description: String { get }
    var duration: Double { get }
    var dateStart: Date { get }
    var ammount: Double { get }
}

struct Quit: QuitType {
    var id: UUID
    var name: String
    var duration: Double {
        let now = Date()
        let duration =  (now.timeIntervalSince1970 - dateStart.timeIntervalSince1970)/60/60/24
        return duration
    }
    var description: String
    var dateStart: Date
    var ammount: Double
    
}

extension Quit {
    static var exampleArray: [Quit] {
        var addictions = [Quit]()
        let yesterday = Calendar.current.date(byAdding: .day,value: -1, to: Date())!
        addictions.append(Quit(id: UUID.init(),name: "Papierosy", description: "", dateStart: yesterday, ammount: 15.50))
        addictions.append(Quit(id: UUID.init(),name: "Alkohol", description: "", dateStart: yesterday - 1999999, ammount: 32.12))
        addictions.append(Quit(id: UUID.init(),name: "Zielsko", description: "", dateStart: yesterday - (4*1999999), ammount: 40.00))
        addictions.append(Quit(id: UUID.init(),name: "Kofeina", description: "", dateStart: yesterday - 10*(4*1999999), ammount: 6.63))
        addictions.append(Quit(id: UUID.init(),name: "Kokaina", description: "", dateStart: yesterday - (5*10*(4*1999999)), ammount: 160))
        addictions.append(Quit(id: UUID.init(),name: "Woda", description: "", dateStart: yesterday + 2, ammount: 0.70))
        addictions.append(Quit(id: UUID.init(),name: "Mleko", description: "", dateStart: yesterday + 4, ammount: 2.29))
        addictions.append(Quit(id: UUID.init(),name: "Kamień", description: "", dateStart: yesterday + 123, ammount: 0.01))
        addictions.append(Quit(id: UUID.init(),name: "Makaron", description: "", dateStart: yesterday, ammount: 5.53))
        addictions.append(Quit(id: UUID.init(),name: "Powietrze", description: "", dateStart: yesterday, ammount: 9999.12))
        addictions.append(Quit(id: UUID.init(),name: "Bednarz Bednarz Bednarz Bednarz Bednarz Bednarz ", description: "", dateStart: yesterday, ammount: 999999999.30))
        return addictions
    }
    static var example: Quit {
        let yesterday = Calendar.current.date(byAdding: .month,value: -1, to: Date())!
        return Quit(id: UUID.init(),name: "Woda", description: "Wodnista woda nie bede jej nigdy pil", dateStart: yesterday, ammount: 7012.42)
    }
}
