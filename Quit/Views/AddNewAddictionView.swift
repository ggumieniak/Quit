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
    
    init() {
        UITextField.appearance().backgroundColor = UIColor(named: "BackgroundCell")
        UITextView.appearance().backgroundColor = UIColor(named: "BackgroundCell")
    }
    
    var body: some View {
        ZStack(alignment: .top){
            Color("BackgroundMain").ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                Text("Name")
                    .font(.title3)
                TextField("",text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Description").font(.title3)
                TextEditor(text: $description)
                    .frame(maxHeight: 200)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(Color.init(.separator))
                    .cornerRadius(10)
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
                Spacer()
                Button(action: {
                    print("Save")
                }, label: {
                    Text("Save")
                        .bold()
                })
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color("SaveDarkColor"))
                .overlay(RoundedRectangle(cornerRadius: 25).stroke(lineWidth: 3).foregroundColor(Color("DetailGrey")))
                .cornerRadius(25)
            }
            .padding()
        }
        .foregroundColor(Color("TextColor"))
        .background(Color("BackgroundMain"))
    }
}

struct AddNewAddictionView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewAddictionView()
    }
}
