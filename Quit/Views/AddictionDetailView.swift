//
//  AddictionDetailView.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 30/04/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import SwiftUI

struct AddictionDetailView: View {
    
    var body: some View {
        ZStack {
            Color("BackgroundCell").ignoresSafeArea(.all)
            Text("Detail")
        }
    }
}

struct AddictionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AddictionDetailView()
    }
}
