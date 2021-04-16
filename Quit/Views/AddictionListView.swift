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
            ZStack{
                List(addictionListVM.addictions) { addiction in
                    VStack{
                        AddictionCellView(addiction: addiction)
                    }
                }
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        NavigationLink(
                            destination: AddNewAddictionView(),
                            label: {
                                Image(systemName: "plus").foregroundColor(.white).font(.title)
                            })//TODO: Make button a bit bigger
                            .frame(width: 50, height: 50, alignment: .center)
                            .background(Color.green.opacity(0.8))
                            .clipShape(Circle())
                            .padding(.trailing)
                    }
                }
            }.navigationTitle("Quit app")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action:{
                        //TODO: Make sort function via days
                        //TODO: Make sort by selected option
                        print("Sort by days")
                    }, label: {
                        Image(systemName: "arrow.up.arrow.down.circle").font(.largeTitle)
                    })
                }
            }
        }.onAppear(perform: addictionListVM.createExampleAddictions)
    }
}
