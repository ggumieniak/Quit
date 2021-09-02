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
    @State var isPresented = false
    @State var newQuit: Quit.Data = Quit.Data()
    var body: some View {
        Form {
            List {
                ForEach (quits, id: \.id) { quit in
                    let index = quits.firstIndex(where: { $0.id == quit.id})!
                    NavigationLink(
                        destination: DetailView(detail: $quits[index]),
                        label: {
                            CellView(quit: quit)
                        })
                }
            }
            Section(header: Text("Something new?"))
            {
                CenteredButton(titleOfButton: "Add me!") {
                    self.isPresented = true
                }
            }
        }
        .navigationTitle("Quit")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {print("options")},label: {
                    Image(systemName: "ellipsis.circle")
                })
            }
        }
        .sheet(isPresented: $isPresented) {
            NavigationView {
                AddView()
                    .navigationBarItems(leading: Button("Dismiss") {
                        isPresented = false
                    }, trailing: Button("Save") {
                        isPresented = false
                    })
            }
                
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        MainView().preferredColorScheme(.dark)
    }
}
