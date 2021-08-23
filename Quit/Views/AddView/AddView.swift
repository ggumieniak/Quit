//
//  AddNewAddictionView.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 16/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @Binding var quit: Quit
    @State var ammount = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            StaticViewProperties.SwiftUIColor.BackgroundMain.ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                Text("Name")
                    .bold()
                TextField("",text: $quit.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Description")
                    .bold()
                TextEditor(text: $quit.description)
                    .frame(maxHeight: 200)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(Color.init(.separator))
                    .cornerRadius(StaticViewProperties.cornerRadius)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Start Date")
                            .bold()
                        DatePicker("", selection: $quit.dateStart, displayedComponents: [.date,.hourAndMinute] )
                            .datePickerStyle(CompactDatePickerStyle())
                            .labelsHidden()
                    }
                    VStack(alignment: .leading) {
                        Text("Money per day").bold().lineLimit(1).scaledToFill()
                        TextField("",text: $ammount)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                    }
                }
                Spacer()
                DarkThemeButton(text: "Save", operation: {})
            }
            .padding()
        }
        .font(.title3)
        .foregroundColor(StaticViewProperties.SwiftUIColor.TextColor)
        .background(StaticViewProperties.SwiftUIColor.BackgroundMain)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
//        AddView(at: addMock(AddView_Previews()))
        AddView(quit: .constant(Quit.example))
    }
    
    func addMock(quit: Quit){}
}
