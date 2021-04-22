//
//  AddNewAddictionView.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 16/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import SwiftUI

struct AddNewAddictionView: View {
    @State var string = ""
    var body: some View {
        //TODO: AddictionView
        VStack{
            Form {
                TextEditor(text: $string).textFieldStyle(RoundedBorderTextFieldStyle())
                Section(header: Text("Moj tekst")) {

                }.padding()
            }
            Form {
                Section(header: Text("Moj tekst")) {
                    TextEditor(text: $string).textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding()
            }
            Form {
                Section(header: Text("Moj tekst")) {
                    TextEditor(text: $string).textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding()
            }
        }
    }
}

struct AddNewAddictionView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewAddictionView()
    }
}
