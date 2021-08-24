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
            HStack {
                NumberOfQuitDayView(duration: $viewModel.duration)
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
    }
}

struct AddictionCellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(quit: Quit.example)
    }
}


//MARK: - AddictionCellView init
extension CellView {
    init(quit: Quit) {
        self.viewModel = CellViewModel(quit)
    }
}

struct NumberOfQuitDayView: View {
    @Binding var duration: String
    var body: some View {
        HStack {
            Text(duration)
                .font(.title3)
                .frame(width: 50)
            Divider()
        }
    }
}
