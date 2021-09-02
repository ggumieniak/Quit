//
//  AddictionDetailView.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 30/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @Binding var detail: Quit
    @State var isEdit = false
    
    var body: some View {
        QuitDetailView(detail: $detail, isEdit: $isEdit)
            .navigationTitle(detail.name)
    }
}

struct QuitDetailView: View {
    @Binding var detail: Quit
    @Binding var isEdit: Bool
    var body: some View {
        List {
            QuoteView()
            Text(detail.description)
            Section(header: Text("Description")) {
                Text(detail.description)
            }
            Section(header: Text("You saved already"), content: {
                Text("\(detail.ammount)")
            })
            Section(header: Text("You quit this at"), content: {
                Text("\(detail.dateStart)")
            })
        }.listStyle(InsetGroupedListStyle())
    }
}

struct QuoteView: View {
    var body: some View {
        VStack {
            Text("Life is the flower for which love is the honey")
                .font(.title)
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
        NavigationView {
            DetailView(detail: .constant(.example))
        }
        NavigationView {
            DetailView(detail: .constant(.example))
                .preferredColorScheme(.dark)
        }
    }
    
}
