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
    var body: some View {
        let addictionCellVM = AddictionCellViewModel(Addiction())
        HStack{
            Text("57").clipShape(Circle()).font(.largeTitle).scaledToFit()
            HStack {
                VStack(alignment: .leading) {
                    Text("You dropped smt since").font(.body)
                    Spacer()
                    Spacer()
                    Text(addictionCellVM.getCurrentData()).font(.caption)
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

struct AddictionCellView_Previews: PreviewProvider {
    static var previews: some View {
        AddictionCellView()
        
    }
}

