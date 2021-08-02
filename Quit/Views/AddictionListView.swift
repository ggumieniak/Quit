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
    @State private var showAlert: Bool = false
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(named: "BackgroundMain")
    }
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundMain").ignoresSafeArea(edges: .all)
                VStack(alignment: .leading) {
                    Text("GGumieniak")
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading)
                        .padding(.top)
                    List {
                        ForEach(addictionListVM.addictions, id: \.id) { addiction in
                            AddictionCellView(addiction: addiction)
                                .listRowBackground(Color("BackgroundMain"))
                                .onTapGesture {
                                    addictionListVM.isShow = true
                                    addictionListVM.showView = addiction
                                }
                        }
                        .onDelete(perform: { indexSet in
                            print("Delete")
                        })
                    }
                    .listStyle(PlainListStyle())
                }
                NavigationLink("", destination: AddictionDetailView(detail: addictionListVM.showView?.name ?? "Invalid Request"), isActive: $addictionListVM.isShow)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(
                            destination: AddNewAddictionView(),
                            label: {
                                Image(systemName: "plus").foregroundColor(.white).font(.title)
                            })
                            .frame(minWidth: 30, idealWidth: 50, maxWidth: 80, minHeight: 30, idealHeight: 50, maxHeight: 80, alignment: .center)
                            .background(Color.green.opacity(0.8))
                            .clipShape(Circle())
                            .padding(25)
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .onAppear(perform: addictionListVM.fetchData)
    }
}


struct AddictionListView_Previews: PreviewProvider {
    static var previews: some View {
        AddictionListView()
    }
}
