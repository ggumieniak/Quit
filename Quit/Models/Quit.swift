//
//  Addiction.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 07/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation

struct Quit {
    var id: UUID
    var title: String
    var description: String
    var date: Date
    var ammount: Double
    
    init(id: UUID = UUID.init(), title: String, description: String, dateStart: Date, ammount: Double) {
        self.id = id
        self.title = title
        self.description = description
        self.date = dateStart
        self.ammount = ammount
    }
}

extension Quit {
    struct Data {
        var title: String = "New Addiction"
        var description: String = ""
        var date: Date = Date()
        var ammount: String = "1.0"
    }
    
    var data: Data {
        return Data(title: title, description: description, date: date, ammount: String(format: "%.2f", ammount))
    }
    
    mutating func update(from data: Quit.Data) {
        title = data.title
        description = data.description
        date = data.date
        ammount = Double(data.ammount)!
    }
}

extension Quit {
    
    static var mockQuitArray: [Quit] {
        var addictions = [Quit]()
        let yesterday = Calendar.current.date(byAdding: .day,value: -1, to: Date())!
        addictions.append(Quit(id: UUID.init(),title: "Papierosy", description: "", dateStart: yesterday, ammount: 15.50))
        addictions.append(Quit(id: UUID.init(),title: "Alkohol", description: "", dateStart: yesterday - 1999999, ammount: 32.12))
        addictions.append(Quit(id: UUID.init(),title: "Zielsko", description: "", dateStart: yesterday - (4*1999999), ammount: 40.00))
        addictions.append(Quit(id: UUID.init(),title: "Kofeina", description: "", dateStart: yesterday - 10*(4*1999999), ammount: 6.63))
        addictions.append(Quit(id: UUID.init(),title: "Kokaina", description: "", dateStart: yesterday - (5*10*(4*1999999)), ammount: 160))
        addictions.append(Quit(id: UUID.init(),title: "Woda", description: "", dateStart: yesterday - 8*(4*1999999), ammount: 0.70))
        addictions.append(Quit(id: UUID.init(),title: "Mleko", description: "", dateStart: yesterday - 6*(4*1999999), ammount: 2.29))
        addictions.append(Quit(id: UUID.init(),title: "Kamień", description: "", dateStart: yesterday - 4*(4*1999999), ammount: 0.01))
        addictions.append(Quit(id: UUID.init(),title: "Makaron", description: "", dateStart: yesterday - 4*(2*1999999), ammount: 5.53))
        addictions.append(Quit(id: UUID.init(),title: "Powietrze", description: "", dateStart: yesterday - 2*1999999, ammount: 9999.12))
        addictions.append(Quit(id: UUID.init(),title: "Bednarz Bednarz Bednarz Bednarz Bednarz Bednarz ", description: "", dateStart: Date(), ammount: 999999999.30))
        return addictions
    }
    static var mockQuit: Quit {
        let yesterday = Calendar.current.date(byAdding: .month,value: -1, to: Date())!
        return Quit(id: UUID.init(),title: "Woda", description: "Wodnista woda nie bede jej nigdy pil", dateStart: yesterday, ammount: 7012.42)
    }
}
