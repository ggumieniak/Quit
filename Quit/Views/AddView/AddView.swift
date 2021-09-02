//
//  AddNewAddictionView.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 16/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var viewModel = AddViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name")
                .bold()
            TextField("",text: $viewModel.quit.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Description")
                .bold()
            TextEditor(text: $viewModel.quit.description)
                .frame(maxHeight: 200)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(RoundedRectangle(cornerRadius: 12)
                            .stroke().foregroundColor(Color.init(.separator)))
                
            HStack {
                VStack(alignment: .leading) {
                    Text("Start Date")
                        .bold()
                    DatePicker("", selection: $viewModel.quit.date, displayedComponents: [.date,.hourAndMinute] )
                        .datePickerStyle(CompactDatePickerStyle())
                        .labelsHidden()
                }
                VStack(alignment: .leading) {
                    Text("Money per day").bold().lineLimit(1).scaledToFill()
                    TextField("",text: $viewModel.quit.ammount)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                }
            }
            Spacer()
        }
        .navigationTitle(viewModel.quit.title)
        .padding([.leading, .trailing])
    }
}



struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
