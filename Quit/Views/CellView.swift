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
                Circle()
                    .foregroundColor(Color("BackgroundCellLighter"))
                    .frame(width: geometry.size.width * 0.2)
                    .overlay(Text("\(viewModel.quit.duration)")
                                .font(.title3)
                                .bold()
                                .aspectRatio(1,contentMode: .fit)
                                .lineLimit(2))
                    .overlay(Circle()
                                .stroke(lineWidth: 3)
                                .foregroundColor(Color("BackgroundMain")))
                VStack(alignment: .leading) {
                    Text(viewModel.quit.name)
                        .lineLimit(1)
                        .font(.title)
                    Text(viewModel.quit.dateStart.toString())
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
        .background(Color("BackgroundCell").cornerRadius(StaticViewProperties.cornerRadius))
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
