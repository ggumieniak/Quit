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
        let addictionCellVM = AddictionVellViewModel()
        HStack{
            Text("Tekst").font(.largeTitle)
            HStack {
                VStack(alignment: .leading) {
                    Text("You dropped smt since")
                    Text(addictionCellVM.getCurrentData()).fontWeight(.light)
                }.padding(.leading,15)
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

