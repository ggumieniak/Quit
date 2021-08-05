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
    @State private var showAlert: Bool = false
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(named: "BackgroundMain")
    }
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundMain")
                    .ignoresSafeArea(edges: .all)
                List {
                    ForEach(viewModel.quits, id: \.id) { addiction in
                        AddictionCellView(addiction: addiction)
                            .listRowBackground(Color("BackgroundMain"))
                            .onTapGesture {
                                viewModel.isShow = true
                                viewModel.detailedQuit = addiction
                            }
                    }
                    .onDelete(perform: { indexSet in
                        print("Delete")
                    })
                }
                .listStyle(PlainListStyle())
                NavigationLink("", destination: AddictionDetailView(detail: viewModel.detailedQuit?.name ?? "Invalid Request"), isActive: $viewModel.isShow)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(
                            destination: AddNewAddictionView(),
                            label: {
                                Image(systemName: "plus")
                                    .font(.title)
                                    .foregroundColor(Color("TextColor"))
                            })
                            .frame(minWidth: 30, idealWidth: 50, maxWidth: 80, minHeight: 30, idealHeight: 50, maxHeight: 80, alignment: .center)
                            .background(Color("SaveDarkColor"))
                            .clipShape(Circle())
                            .overlay(Circle()
                                        .stroke(lineWidth: 0.5)
                                        .foregroundColor(Color("DetailGrey")))
                            .padding(25)
                            
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .onAppear(perform: viewModel.fetchData)
    }
}


struct AddictionListView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
