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
            //TODO: Add color depence on duration of abstitence
            Circle().foregroundColor(.blue)
                .frame(width: 70, height: 70, alignment: .center)
                //FIXME: Cut the day from addictionStart to actual day of abstinent
                .overlay(Text(viewModel.addiction.duration.description).aspectRatio(1,contentMode: .fit))
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text(viewModel.addiction.name).font(.body)
                    Text(viewModel.addiction.dateStart.description).font(.caption)
                }
                VStack {
                    Spacer()
                    //TODO: Adds a localized strings
                    //TODO: Adds to saved money value
                    Text("You saved already: value").font(.caption)
                }
            }
        }
        .padding(.trailing, 10)
        .cornerRadius(10)
    }
}

//MARK: - AddictionCellView init
extension AddictionCellView {
    init(addiction: Addiction) {
        self.viewModel = AddictionCellViewModel(addiction)
    }
}
