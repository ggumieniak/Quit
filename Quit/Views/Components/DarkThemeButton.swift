//
//  DarkThemeButton.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 19/08/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import SwiftUI

struct DarkThemeButton: View {
    
    @State var text: String
    let operation: () -> ()
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            operation()
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Text(text)
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
}

struct DarkThemeButton_Previews: PreviewProvider {
    static var previews: some View {
        DarkThemeButton(text: "Hello") {
            print("Hello World!")
        }
    }
}
