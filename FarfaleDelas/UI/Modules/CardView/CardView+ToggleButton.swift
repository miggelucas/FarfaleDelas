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
                if info.cardType == .activity {
                    info.startsOpen.toggle()
                }
            }
        }, label: {
            VStack {
                Text("􀆊")
                    .rotationEffect(toggleIcon().0)
                    .foregroundColor(info.isOngoing ? Color(ColorConstant.PRIMARY_BLACK) : Color(ColorConstant.SECONDARY_PINK_HOVER))
            }.frame(width: toggleIcon().1, height: toggleIcon().2)
        })
        .opacity(info.cardType == .pause ? 0.0 : 1.0)
        .buttonStyle(.plain)
        
    }
}
