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
//    @ObservedObject var viewModel: CellViewModel
    let quit: Quit.Data
    
    var body: some View {
            HStack {
                NumberOfQuitDayView(date: quit.date)
                VStack(alignment: .leading) {
                    Text(quit.title)
                        .font(.title)
                        .bold()
                    Text(quit.date, style: .date)
                        .font(.footnote)
                        .bold()
                    Text(quit.ammount)
                        .foregroundColor(.green)
                        
                }
            }.frame(height: 80)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(quit: Quit.mockQuit.data)
            .previewLayout(.sizeThatFits)
    }
}

struct NumberOfQuitDayView: View {
    let date: Date
    private var duration: String {
        let now = Date()
        let duration =  (now.timeIntervalSince1970 - date.timeIntervalSince1970)/60/60/24
        return duration >= 1 ? "\(Int(duration))" : String(format: "%.2f", duration)
    }
    var body: some View {
        HStack {
            Text("\(duration)")
                .font(.title3)
                .frame(width: 50)
                .lineLimit(1)
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
