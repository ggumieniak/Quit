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
                List {
                    ForEach(addictionListVM.addictions) { addiction in
                        AddictionCellView(addiction: addiction)
                    }.onDelete(perform: addictionListVM.removeAddiction)
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
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action:{
                        //TODO: Make sort function via days
                        //TODO: Make sort by selected option
                        print("Sort by days")
                    }, label: {
                        Image(systemName: "arrow.up.arrow.down.circle").font(.largeTitle)
                    })
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }.onAppear(perform: addictionListVM.createExampleAddictions)
    }
}
