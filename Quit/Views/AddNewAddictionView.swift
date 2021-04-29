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
            Text("Name")
                .font(.title3)
            TextField("Habit name",text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Divider()
            Text("Description").font(.title3)
            TextEditor(text: $description)
                .frame(maxHeight: 200)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.init(.separator))
                .cornerRadius(3)
            Divider()
            HStack {
                VStack {
                    Text("Start Date").font(.title3)
                    DatePicker("", selection: $date, displayedComponents: [.date] )
                        .datePickerStyle(DefaultDatePickerStyle())
                        .labelsHidden()
                }
                VStack {
                    Text("Money per day")
                    TextField("",text:$title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                }
            }
            Divider()
            Button(action: {
                print("Save")
            }, label: {
                Text("save")
            })
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(25)
        }.padding()
    }
}

struct AddNewAddictionView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewAddictionView()
    }
}
