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
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name")
                .bold()
            TextField("",text: $viewModel.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Description")
                .bold()
            TextEditor(text: $viewModel.description)
                .frame(maxHeight: 200)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(RoundedRectangle(cornerRadius: 12)
                            .stroke().foregroundColor(Color.init(.separator)))
                
            HStack {
                VStack(alignment: .leading) {
                    Text("Start Date")
                        .bold()
                    DatePicker("", selection: $viewModel.date, displayedComponents: [.date,.hourAndMinute] )
                        .datePickerStyle(CompactDatePickerStyle())
                        .labelsHidden()
                }
                VStack(alignment: .leading) {
                    Text("Money per day").bold().lineLimit(1).scaledToFill()
                    TextField("",text: $viewModel.ammount)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                }
            }
            Spacer()
        }.padding([.leading, .trailing])
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView(isPresented: .constant(true))
        }
    }
    
    func addMock(quit: Quit){}
}
