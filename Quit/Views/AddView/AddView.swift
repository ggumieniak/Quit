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
    
    var body: some View {
        ZStack(alignment: .top) {
            StaticViewProperties.SwiftUIColor.BackgroundMain.ignoresSafeArea(.all)
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
                .background(StaticViewProperties.SwiftUIColor.SaveDarkColor)
                .overlay(RoundedRectangle(cornerRadius: StaticViewProperties.cornerRadius)
                            .stroke(lineWidth: 1)
                            .foregroundColor(StaticViewProperties.SwiftUIColor.DetailGrey))
                .cornerRadius(StaticViewProperties.cornerRadius)
            }
            .padding()
        }
        .font(.title3)
        .foregroundColor(StaticViewProperties.SwiftUIColor.TextColor)
        .background(StaticViewProperties.SwiftUIColor.BackgroundMain)
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension AddView {
    init(at addQuit: @escaping (Quit)->()) {
        self.viewModel = AddViewModel(at: addQuit)
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(at: addMock(AddView_Previews()))
    }
    
    func addMock(quit: Quit){}
}
