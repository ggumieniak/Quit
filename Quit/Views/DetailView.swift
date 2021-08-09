//
//  AddictionDetailView.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 30/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @State var detail: String
    @State var quit: Quit = Quit.example
    
    var body: some View {
        ZStack {
            StaticViewProperties.SwiftUIColor.BackgroundMain.ignoresSafeArea(.all)
            Text("\(detail)")
        }.foregroundColor(StaticViewProperties.SwiftUIColor.TextColor)
    }
}


struct AddictionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(detail: "Test")
    }
}
