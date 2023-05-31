//
//  CardView+ToggleButton.swift
//  FarfaleDelas
//
//  Created by Bof on 25/05/23.
//

import Foundation
import SwiftUI

extension CardView {
    var toggleButton: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.25)) {
                isOpen.toggle()
            }
        }, label: {
            VStack {
                Text("􀆊")
                    .rotationEffect(toggleIcon().0)
                    .foregroundColor(.black)
            }.frame(width: toggleIcon().1, height: toggleIcon().2)
        })
        .buttonStyle(.plain)
        
    }
}
