//
//  AddNewAddictionView.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 16/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @Environment (\.presentationMode) var presentationMode
    @Environment (\.colorScheme) var colorScheme
    
    @ObservedObject var viewModel: AddViewModel
    
    init(at addQuit: @escaping (Quit)->()) {
        UITextField.appearance().backgroundColor = UIColor(named: "BackgroundCell")
        UITextView.appearance().backgroundColor = UIColor(named: "BackgroundCell")
        UIDatePicker.appearance().tintColor = UIColor(named: "DatePickerText")
        UINavigationBar.appearance().tintColor = UIColor(named: "TextColor")
        self.viewModel = AddViewModel(at: addQuit)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color("BackgroundMain").ignoresSafeArea(.all)
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
                    .border(Color.init(.separator))
                    .cornerRadius(StaticViewProperties.cornerRadius)
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
                Button(action: {
                    self.viewModel.addQuit()
                    presentationMode.wrappedValue.dismiss()
                    
                }, label: {
                    Text("Save")
                        .bold()
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                })
                .background(Color("SaveDarkColor"))
                .overlay(RoundedRectangle(cornerRadius: StaticViewProperties.cornerRadius)
                            .stroke(lineWidth: 1)
                            .foregroundColor(Color("DetailGrey")))
                .cornerRadius(StaticViewProperties.cornerRadius)
            }
            .padding()
        }
        .font(.title3)
        .foregroundColor(Color("TextColor"))
        .background(Color("BackgroundMain"))
    }
}

//
//struct AddNewAddictionView_Previews: PreviewProvider {
//    static var previews: some View {
////        AddView(at: <#T##(Quit) -> ()#>)
//    }
//}
