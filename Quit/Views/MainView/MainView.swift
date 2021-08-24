//
//  ContentView.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 17/08/2020.
//  Copyright © 2020 Grzegorz Gumieniak. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            ListOfQuitsView(quits: $viewModel.quits)
        }
        .onAppear(perform: viewModel.fetchData)
    }
}


struct AddictionListView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct ListOfQuitsView: View {
    @Binding var quits: [Quit]
    var body: some View {
        List {
            VStack(alignment: .center) {
                ForEach (quits, id: \.id) { quit in
                    NavigationLink(
                        destination: DetailView(detail: quit),
                        label: {
                            CellView(quit: quit)
                        })
                    Divider()
                }
                Button(action: {print("hehe")}, label: {
                    Text("Add me!")
                })
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Quit")
    }
}
