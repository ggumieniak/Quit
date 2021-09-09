//
//  ContentView.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 24/08/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
        MainView(context: managedObjectContext)
            .environmentObject(QuitsStore(context: managedObjectContext))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
