//
//  StaticViewProperties.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 02/08/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct StaticViewProperties {
    static let cornerRadius = CGFloat(25)
    struct UIColors {
        static let BackgroundCell = UIColor(named: "BackgroundCell")
        static let BackgroundCellLighter = UIColor(named: "BackgroundCellLighter")
        static let BackgroundMain = UIColor(named: "BackgroundMain")
        static let Citrine = UIColor(named: "Citrine")
        static let Creme = UIColor(named: "Creme")
        static let DatePickerText = UIColor(named: "DatePickerText")
        static let DetailGrey = UIColor(named: "DetailGrey")
        static let SaveDarkColor = UIColor(named: "SaveDarkColor")
        static let TextColor = UIColor(named: "TextColor")
    }
    struct SwiftUIColor {
        static let BackgroundCell = Color("BackgroundCell")
        static let BackgroundCellLighter = Color("BackgroundCellLighter")
        static let BackgroundMain = Color("BackgroundMain")
        static let Citrine = Color("Citrine")
        static let Creme = Color("Creme")
        static let DatePickerText = Color("DatePickerText")
        static let DetailGrey = Color("DetailGrey")
        static let SaveDarkColor = Color("SaveDarkColor")
        static let TextColor = Color("TextColor")
    }
}
