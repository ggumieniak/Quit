//
//  CenteredButton.swift
//  Quit
//
//  Created by Grzegorz Gumieniak on 24/08/2021.
//  Copyright © 2021 Grzegorz Gumieniak. All rights reserved.
//

import SwiftUI

struct CenteredButton: View {
    let titleOfButton: String
    let action: () -> Void
    var body: some View {
        HStack {
            Spacer()
            Button(action: action, label: {
                Text(titleOfButton)
            })
            Spacer()
        }
    }
}

struct CenteredButtonPreviews: PreviewProvider {
    static var previews: some View {
        CenteredButton(titleOfButton: "Hello World!", action: {})
            .previewLayout(.sizeThatFits)
    }
}

