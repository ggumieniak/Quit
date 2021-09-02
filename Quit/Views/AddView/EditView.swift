//
//  AddNewAddictionView.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 16/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import SwiftUI

struct EditView: View {
    @Binding var quit: Quit.Data
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name")
                .bold()
            TextField("",text: $quit.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Description")
                .bold()
            TextEditor(text: $quit.description)
                .frame(maxHeight: 200)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(RoundedRectangle(cornerRadius: 12)
                            .stroke().foregroundColor(Color.init(.separator)))
                
            HStack {
                VStack(alignment: .leading) {
                    Text("Start Date")
                        .bold()
                    DatePicker("", selection: $quit.date, displayedComponents: [.date,.hourAndMinute] )
                        .datePickerStyle(CompactDatePickerStyle())
                        .labelsHidden()
                }
                VStack(alignment: .leading) {
                    Text("Money per day").bold().lineLimit(1).scaledToFill()
                    TextField("",text: $quit.ammount)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                }
            }
            Spacer()
        }
        .navigationTitle(quit.title)
        .padding([.leading, .trailing])
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditView(quit: .constant(Quit.Data.init()))
        }
    }
}
