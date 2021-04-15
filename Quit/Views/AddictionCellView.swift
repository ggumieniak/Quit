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
            Text(viewModel.addiction.duration.description).clipShape(Circle()).font(.largeTitle).scaledToFit()
            HStack {
                VStack(alignment: .leading) {
                    Text(viewModel.addiction.name).font(.body)
                    Text(viewModel.addiction.dateStart.description).font(.caption)
                }.padding(.leading,15)
                Spacer()
                VStack(){
                    Text("Hello World")
                    Text("Hello World")
                    Text("Hello World")
                }
            }
        }.padding(10)
    }
}

extension AddictionCellView {
    init(addiction: Addiction) {
        self.viewModel = AddictionCellViewModel(addiction)
    }
}
