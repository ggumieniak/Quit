//
//  Addiction.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 07/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation

protocol AddictionType {
    var name: String { get }
    var duration: Double { get }
    var dateStart: Date { get }
}

struct Addiction: AddictionType {
    var name: String
    
    var duration: Double
    
    var dateStart: Date
    
}
