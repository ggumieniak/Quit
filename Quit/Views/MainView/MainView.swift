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

struct ListOfQuitsView: View {
    @Binding var quits: [Quit]
    var body: some View {
        Form {
            List {
                ForEach (quits, id: \.id) { quit in
                    NavigationLink(
                        destination: DetailView(detail: quit),
                        label: {
                            CellView(quit: quit)
                        })
                }
            }
            Section(header: Text("Something new?"))
            {
                CenteredButton(titleOfButton: "Add me!")
            }
        }
        .navigationTitle("Quit")
        .navigationBarItems(trailing: Button(action: {print("haha")}, label: {
            Image(systemName: "plus.square").font(.title)
        }))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
