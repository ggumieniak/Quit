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
//    @ObservedObject var addictionCellVM: AddictionCellViewModel
    
    var body: some View {
        HStack{
            Text("57").clipShape(Circle()).font(.largeTitle).scaledToFit()
            HStack {
                VStack(alignment: .leading) {
                    Text("You dropped smt since").font(.body)
                    Spacer()
                    Spacer()
//                    Text(addictionCellVM.getCurrentData()).font(.caption)
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
