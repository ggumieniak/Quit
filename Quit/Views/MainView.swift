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
    @FetchRequest(entity: Quits.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Quits.title, ascending: true)]) var quits: FetchedResults<Quits>
    
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
        List {
            ForEach (quits, id: \.id) { quit in
                let index = quits.firstIndex(where: { $0.id == quit.id})!
                NavigationLink(
                    destination: DetailView(quit: $quits[index]),
                    label: {
                        CellView(quit: quit.data)
                    })
            }
            Section(header: Text("Something new?"))
            {
                CenteredButton(titleOfButton: "Add me!") {
                    self.isPresented = true
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
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
                EditView(quit: $newQuit)
                    .navigationBarItems(leading: Button("Dismiss") {
                        isPresented = false
                    }, trailing: Button("Save") {
                        let quit = Quit(title: newQuit.title, description: newQuit.description, dateStart: newQuit.date, ammount: Double(newQuit.ammount)!)
                        quits.append(quit)
                        newQuit = Quit.Data()
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
