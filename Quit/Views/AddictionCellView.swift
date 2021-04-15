//
//  AddictionCellView.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 07/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation
import SwiftUI

struct AddictionCellView: View {
    @ObservedObject var viewModel: AddictionCellViewModel
    
    var body: some View {
        HStack{
            //FIXME: Cut the day from addictionStart to actual day of abstinent
            Text(viewModel.addiction.duration.description)
                .frame(width: 70, height: 70, alignment: .center)
                .clipShape(Circle())
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text(viewModel.addiction.name).font(.body)
                    Text(viewModel.addiction.dateStart.description).font(.caption)
                }
                VStack {
                    Spacer()
                    //TODO: - Adds a localized strings
                    //TODO: - Adds to saved money value
                    Text("Zaoszczedziles juz").font(.caption)
                }
            }
        }
    }
}

//MARK: - AddictionCellView init
extension AddictionCellView {
    init(addiction: Addiction) {
        self.viewModel = AddictionCellViewModel(addiction)
    }
}
