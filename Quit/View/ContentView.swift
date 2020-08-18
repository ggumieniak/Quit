//
//  ContentView.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 17/08/2020.
//  Copyright © 2020 Grzegorz Gumieniak. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Quit!")
                .foregroundColor(Color(.blue))
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 50)
                .font(.system(size: 30, weight: .bold, design: Font.Design.rounded))
            ZStack{
                // viewModel to ...
                List(0..<10) { _ in
                    VStack{
                        Text("Addiction")
                        // on press go furhter
                    }
                }
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button(action: {
                            print("I activated the new view!")
                        }){
                            Text("+")
                        }.padding()
                            .background(Color.green.opacity(0.8))
                            .clipShape(Circle())
                            .padding(.trailing)
                            .foregroundColor(Color(.white))
                            
                    }
                }
            }
        }.background(Color(.black))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
