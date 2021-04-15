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
                        Button(action: {
                            //TODO: make segue to addAddiction
                            print("AddNewAddiction")
                        }){
                            Image(systemName: "plus").foregroundColor(.white)
                        }.padding()
                        //TODO: Make button a bit bigger
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
