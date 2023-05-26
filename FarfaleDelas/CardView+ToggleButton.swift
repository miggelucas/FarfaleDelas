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
                Text(isOpen ? "􀆈" : "􀆊")
                    .foregroundColor(.black)
            }.frame(width: 60, height: 44)
        }).buttonStyle(.plain)
        
    }
}
