//
//  AddictionCellView.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 07/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import Foundation
import SwiftUI

struct CellView: View {
    @ObservedObject var viewModel: CellViewModel
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Text(viewModel.duration)
                    .font(.title3)
                    .bold()
                    .lineLimit(1)
                    .padding(1)
                VStack(alignment: .leading) {
                    Text(viewModel.name)
                        .lineLimit(1)
                        .font(.title)
                    Text(viewModel.date)
                        .font(.footnote)
                        .bold()
                    Text("you saved now: \(viewModel.ammount)")
                        .font(.footnote)
                }
            }
            .padding()
        }
        .frame(height: 100)
    }
}

struct AddictionCellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(addiction: Quit.example)
    }
}


//MARK: - AddictionCellView init
extension CellView {
    init(addiction: Quit) {
        self.viewModel = CellViewModel(addiction)
    }
}
