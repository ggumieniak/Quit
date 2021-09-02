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
                HStack {
                    Text(detail.date,style: .date)
                    Text(detail.date, style: .time)
                }
            })
        }
        .navigationTitle(detail.title)
        .listStyle(InsetGroupedListStyle())
        .fullScreenCover(isPresented: $isEdit) {
//            AddView(quit: )
        }
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
            DetailView(detail: .constant(.mockQuit))
        }
        NavigationView {
            DetailView(detail: .constant(.mockQuit))
                .preferredColorScheme(.dark)
        }
    }
    
}
