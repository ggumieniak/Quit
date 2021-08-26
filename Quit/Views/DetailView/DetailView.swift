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
        QuitDetailView(detail: $detail, isEdit: $isEdit)
        .padding()
        .navigationTitle(detail.name)
    }
}

struct QuitDetailView: View {
    @Binding var detail: Quit
    @Binding var isEdit: Bool
    var body: some View {
        VStack(alignment: .leading) {
            QuoteView()
            Divider()
            Text(detail.description)
            Section(header: Text("Description")) {
                Text(detail.description)
            }
            Spacer()
        }
    }
}

struct QuoteView: View {
    var body: some View {
        VStack {
            Text("Life is the flower for which love is the honey")
                .font(.largeTitle)
            HStack {
                Spacer()
                Text("Victor Hugo")
                    .foregroundColor(.gray)
                    .font(.body)
            }
        }
    }
}

struct AddictionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailView(detail: .example)
            DetailView(detail: .example)
                .preferredColorScheme(.dark)
        }
    }
    
}
