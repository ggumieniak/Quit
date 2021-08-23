//
//  AddictionDetailView.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 30/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @State var detail: Quit
    @State var isEdit = false
    
    var body: some View {
        ZStack {
            StaticViewProperties.SwiftUIColor.BackgroundMain
                .ignoresSafeArea(.all)
            if isEdit {
                AddView(quit: $detail)
            } else {
                VStack {
                    VStack {
                        QuitText(text: detail.name, font: .largeTitle)
                        HStack {
                            QuitText(text: "You quit at:\n\(detail.dateStart.toString())")
                            QuitText(text: "You already saved: \(detail.ammount * detail.duration)")
                        }
                        QuitText(text: detail.description)
                        Spacer()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: StaticViewProperties.cornerRadius)
                                    .foregroundColor(StaticViewProperties.SwiftUIColor.BackgroundCell).padding())
                    Spacer()
                    DarkThemeButton(text: "Edit") {
                        isEdit.toggle()
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .foregroundColor(StaticViewProperties.SwiftUIColor.TextColor)
    }
}

struct QuitText: View {
    @State var text: String
    private let font: Font
    init(text: String, font: Font = .body) {
        self.text = text
        self.font = font
    }
    var body: some View {
        Text(text)
            .font(font)
            .frame(maxWidth: .infinity)
            .padding(2)
            .background(RoundedRectangle(cornerRadius: StaticViewProperties.cornerRadius)
                            .foregroundColor(StaticViewProperties.SwiftUIColor.BackgroundMain))
            .padding()
    }
}

struct AddictionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(detail: .example)
    }
    
}
