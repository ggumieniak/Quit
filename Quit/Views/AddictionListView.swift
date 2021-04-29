//
//  ContentView.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 17/08/2020.
//  Copyright © 2020 Grzegorz Gumieniak. All rights reserved.
//

import SwiftUI

struct AddictionListView: View {
    @StateObject private var addictionListVM: AddictionListViewModel = AddictionListViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVStack {
                        ForEach(addictionListVM.addictions) { addiction in
                            NavigationLink(destination: Text(addiction.name)){
                                LazyVStack {
                                    AddictionCellView(addiction: addiction)
                                }
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }.padding()
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(
                            destination: AddNewAddictionView(),
                            label: {
                                Image(systemName: "plus").foregroundColor(.white).font(.title)
                            })
                            .frame(width: 50, height: 50, alignment: .center)
                            .background(Color.green.opacity(0.8))
                            .clipShape(Circle())
                            .padding(25)
                    }
                }
            }.navigationTitle("Quit app")
        }
        .onAppear(perform: addictionListVM.createExampleAddictions)
    }
}
