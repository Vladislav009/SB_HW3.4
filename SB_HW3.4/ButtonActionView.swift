//
//  ButtonActionView.swift
//  SB_HW3.4
//
//  Created by Vladislav Kulak on 01.02.2022.
//

import SwiftUI

struct ButtonActionView: View {
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
        }
        .padding()
    }
}

struct ButtonActionView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonActionView(text: "", action: {})
    }
}
