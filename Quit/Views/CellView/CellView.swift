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
                        .font(.title)
                    Text(viewModel.date)
                        .font(.footnote)
                        .bold()
                    AmmountView(ammount: $viewModel.ammount)
                        
                }.lineLimit(1)
            }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(quit: Quit.example)
    }
}


//MARK: - CellView init
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

struct AmmountView: View {
    @Binding var ammount: String
    var body: some View {
        HStack {
            Text("you saved now:")
                .font(.footnote)
            Text("\(ammount)")
                .font(.footnote)
                .foregroundColor(.green)
        }
    }
}
