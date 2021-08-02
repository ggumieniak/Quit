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
        GeometryReader { geometry in
            HStack {
                Circle().foregroundColor(Color("DetailGrey")).frame(width: geometry.size.width * 0.2).overlay(Text("\(viewModel.addiction.duration)").aspectRatio(1,contentMode: .fit).lineLimit(2))
                VStack(alignment: .leading) {
                    Text(viewModel.addiction.name)
                        .lineLimit(1)
                        .font(.title)
                    Text(viewModel.addiction.dateStart.toString())
                        .font(.footnote)
                        .bold()
                    Text("you saved now")
                        .font(.footnote)
                        .foregroundColor(Color("Citrine"))
                }
            }
            .padding()
        }
        .foregroundColor(Color("TextColor"))
        .frame(height: 100)
        .background(Color("BackgroundCell").cornerRadius(25))
    }
}

struct AddictionCellView_Previews: PreviewProvider {
    static var previews: some View {
        AddictionCellView(addiction: Addiction.example)
    }
}


//MARK: - AddictionCellView init
extension AddictionCellView {
    init(addiction: Addiction) {
        self.viewModel = AddictionCellViewModel(addiction)
    }
}
