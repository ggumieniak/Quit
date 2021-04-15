//
//  Addiction.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 07/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation

protocol AddictionType: Identifiable {
    var id: Int { get }
    var name: String { get }
    var duration: Date { get }
    var dateStart: Date { get }
}

struct Addiction: AddictionType {
    var id: Int 
    
    var name: String
    
    var duration: Date {
        let today = Date()
        return today
    }
    
    var dateStart: Date
    
}
