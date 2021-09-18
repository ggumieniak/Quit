//
//  AddictionDetailView.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 30/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @Binding var quit: Quit
    @State var newQuit: Quit.Data = Quit.Data()
    @State var isPresented = false
    @EnvironmentObject var quitsStore: QuitsStore
    var body: some View {
        List {
            QuoteView()
            Section(header: Text("Description")) {
                Text(quit.data.description)
            }
            Section(header: Text("You saved already"), content: {
                Text(quit.data.ammountSaved)
            })
            Section(header: Text("You quit this at"), content: {
                HStack {
                    Text(quit.data.date,style: .date)
                    Text(quit.data.date, style: .time)
                }
            })
        }
        .navigationTitle(quit.title)
        .listStyle(InsetGroupedListStyle())
        .navigationBarItems(trailing: Button("Edit") {
            isPresented = true
            newQuit = quit.data
        })
        .fullScreenCover(isPresented: $isPresented) {
            NavigationView {
                EditView(quit: $newQuit)
                    .navigationBarItems(leading: Button("Dismiss") {
                        isPresented = false
                    }, trailing: Button("Save"){
                        quit.update(from: newQuit)
                        quitsStore.updateQuit(quit: quit)
                        isPresented = false
                    })
            }
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
            DetailView(quit: .constant(Quit.mockQuit))
        }
        NavigationView {
            DetailView(quit: .constant(Quit.mockQuit))
                .preferredColorScheme(.dark)
        }
    }
    
}
