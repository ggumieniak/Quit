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
        VStack(alignment: .leading) {
            QuoteView()
                Text(detail.description)
            Section(header: Text("Description")) {
                Text(detail.description)
            }
            Spacer()
        }
        .navigationTitle(detail.name)
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

struct QuoteView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    Text("Life is the flower for which love is the honey").font(.largeTitle).multilineTextAlignment(.center)
                    HStack {
                        Spacer()
                        Text("Victor Hugo")
                            .font(.body)
                    }
                }
                Spacer()
            }
        }
    }
}
