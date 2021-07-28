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
        UITabBar.appearance().barTintColor = UIColor(named: "BackgroundMain")
    }
    var body: some View {
        TabView {
            NavigationView {
                ZStack {
                    Color("BackgroundMain").ignoresSafeArea(.all)
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text("Habbits").font(.title).bold().frame(alignment: .trailing).padding()
                            ForEach(addictionListVM.addictions, id: \.id) { addiction in
                                AddictionCellView(addiction: addiction).onTapGesture {
                                    addictionListVM.isShow = true
                                    addictionListVM.showView = addiction
                                }
                            }
                        }
                        NavigationLink("", destination: AddictionDetailView(detail: addictionListVM.showView?.name ?? "Invalid Request"), isActive: $addictionListVM.isShow)
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
                
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }.tabItem { Text("Habbits").buttonStyle(PlainButtonStyle()) }
            Text("hahaha").tabItem { Text("Mateusz") }
        }
        //        .toolbar {
        //            ToolbarItemGroup(placement: .navigationBarLeading) {
        //                NavigationLink(
        //                    destination: AddNewAddictionView(),
        //                    label: {
        //                        Image(systemName: "plus").foregroundColor(.white).font(.title)
        //                    })
        //            }
        //        }
        .onAppear(perform: addictionListVM.createExampleAddictions)
    }
}


struct AddictionListView_Previews: PreviewProvider {
    static var previews: some View {
        AddictionListView()
    }
}
