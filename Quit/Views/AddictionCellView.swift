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
        HStack {
            //TODO: Add color depence on duration of abstitence
            RoundedRectangle(cornerRadius: 25).foregroundColor(.blue)
                .frame(width: 100, alignment: .center)
                //FIXME: Cut the day from addictionStart to actual day of abstinent
                .overlay(Text(viewModel.addiction.duration.description).aspectRatio(1,contentMode: .fit))
            VStack(alignment: .leading) {
                Text(viewModel.addiction.name)
                    .font(.body)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 25)
                                    .foregroundColor(Color.red))
                
                Divider()
                HStack {
                    Text(viewModel.addiction.dateStart.description)
                        .font(.caption)
                        .background(RoundedRectangle(cornerRadius: 25).foregroundColor(Color.init(.lightGray)))
                    //TODO: Adds a localized strings
                    //TODO: Adds to saved money value
                    Text("You saved already: 999999999")
                        .font(.caption)
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
            }
            
        }
        .background(Color.init(.lightGray))
        .cornerRadius(25)
    }
}

struct AddictionCellView_Previews: PreviewProvider {
    static var previews: some View {
        AddictionCellView(addiction: Addiction(id: 1, name: "Bednarz", dateStart: Date()))
    }
}


//MARK: - AddictionCellView init
extension AddictionCellView {
    init(addiction: Addiction) {
        self.viewModel = AddictionCellViewModel(addiction)
    }
}
