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
    
    var body: some View {
        NavigationView {
            ZStack {
                StaticViewProperties.SwiftUIColor.BackgroundMain
                List {
                    ForEach(viewModel.quits, id: \.id) { addiction in
                        CellView(addiction: addiction)
                            .listRowBackground(StaticViewProperties.SwiftUIColor.BackgroundMain)
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
                NavigationLink("", destination: DetailView(detail: viewModel.detailedQuit ?? Quit.example), isActive: $viewModel.isShow)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(
                            destination: AddView(quit: <#Binding<Quit>#>),
                            label: {
                                Image(systemName: "plus")
                                    .font(.title)
                                    .foregroundColor(StaticViewProperties.SwiftUIColor.TextColor)
                            })
                            .frame(minWidth: 30, idealWidth: 50, maxWidth: 80, minHeight: 30, idealHeight: 50, maxHeight: 80, alignment: .center)
                            .background(StaticViewProperties.SwiftUIColor.SaveDarkColor)
                            .clipShape(Circle())
                            .overlay(Circle()
                                        .stroke(lineWidth: 0.5)
                                        .foregroundColor(StaticViewProperties.SwiftUIColor.DetailGrey))
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
