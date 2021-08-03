//
//  AddNewAddictionView.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 16/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import SwiftUI

struct AddNewAddictionView: View {
    @Environment (\.presentationMode) var presentationMode
    @Environment (\.colorScheme) var colorScheme
    @State var title = ""
    @State var description = ""
    @State var date = Date()
    @State var ammount = ""
    
    init() {
        UITextField.appearance().backgroundColor = UIColor(named: "BackgroundCell")
        UITextView.appearance().backgroundColor = UIColor(named: "BackgroundCell")
        UIDatePicker.appearance().tintColor = UIColor(named: "DatePickerText")
    }
    
    var body: some View {
        ZStack(alignment: .top){
            Color("BackgroundMain").ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                Text("Name")
                    .bold()
//                    .font(.title3)
                TextField("",text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Description")
                    .bold()
//                    .font(.title3)
                TextEditor(text: $description)
                    .frame(maxHeight: 200)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(Color.init(.separator))
                    .cornerRadius(StaticViewProperties.cornerRadius)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Start Date")
                            .bold()
//                            .font(.title3)
                        DatePicker("", selection: $date, displayedComponents: [.date,.hourAndMinute] )
                            .datePickerStyle(CompactDatePickerStyle())
                            .labelsHidden()
//                        DatePickerCustom(date: $date).frame(height: 50)
                    }
                    VStack(alignment: .leading) {
                        Text("Money per day")
                            .bold()
//                            .font(.title3)
                        TextField("",text:$ammount)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                    }
                }
                Spacer()
                Button(action: {
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

struct AddNewAddictionView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewAddictionView()
    }
}
