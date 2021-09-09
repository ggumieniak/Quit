//
//  ContentView.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 17/08/2020.
//  Copyright © 2020 Grzegorz Gumieniak. All rights reserved.
//

import SwiftUI
import CoreData
struct MainView: View {
    @ObservedObject private var viewModel: MainViewModel
    @EnvironmentObject var quitsStore: QuitsStore
    
    var body: some View {
        NavigationView {
            ListOfQuitsView(quits: $quitsStore.quits)
        }
    }
}

extension MainView {
    init(context: NSManagedObjectContext) {
        viewModel = MainViewModel(context: context)
    }
}

struct ListOfQuitsView: View {
    @EnvironmentObject var quitsStore: QuitsStore
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
                        quitsStore.addQuit(quit: quit)
                        newQuit = Quit.Data()
                        isPresented = false
                    })
            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(context: NSManagedObjectContext())
        MainView(context: NSManagedObjectContext()).preferredColorScheme(.dark)
    }
}
