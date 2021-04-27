//
//  AddNewAddictionView.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 16/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import SwiftUI

struct AddNewAddictionView: View {
    @State var title = ""
    @State var description = ""
    @State var date = Date()
    var body: some View {
        //TODO: AddictionView
        VStack(alignment: .leading) {
            Text("Name of habit").font(.title3).padding()
            TextField("Title",text: $title).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            Divider()
            Text("Description").font(.title3).padding()
            TextEditor(text: $description)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.init(.separator))
                .cornerRadius(3)
                .padding()
            Divider()
            HStack {
                VStack {
                    Text("Start Date").font(.title3).padding()
                    DatePicker("", selection: $date).datePickerStyle(DefaultDatePickerStyle())
                        .labelsHidden()
                }
                VStack {
                    Text("Money per day").padding()
                    TextField("",text:$title).textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            Divider()
            Spacer()
        }
    }
}

struct AddNewAddictionView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewAddictionView()
    }
}
