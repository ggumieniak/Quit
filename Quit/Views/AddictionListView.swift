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
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(named: "BackgroundMain")        
    }
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundMain").ignoresSafeArea(.all)
                ScrollView {
                    LazyVStack {
                        ForEach(addictionListVM.addictions) { addiction in
                            NavigationLink(destination: AddictionDetailView(), label: {
                                AddictionCellView(addiction: addiction)
                            }).buttonStyle(PlainButtonStyle())
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
                            .frame(idealWidth: 50, maxWidth: 75, idealHeight: 50, maxHeight: 75, alignment: .center)
                            .background(Color.green.opacity(0.8))
                            .clipShape(Circle())
                            .padding(25)
                    }
                }
            }
            .navigationBarTitle("Habit tracker!", displayMode: .inline)
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                NavigationLink(
                    destination: AddNewAddictionView(),
                    label: {
                        Image(systemName: "plus").foregroundColor(.white).font(.title)
                    })
            }
        }
        .onAppear(perform: addictionListVM.createExampleAddictions)
    }
}


struct AddictionListView_Previews: PreviewProvider {
    static var previews: some View {
        AddictionListView()
    }
}
