//
//  OngoingCard.swift
//  FarfaleDelas
//
//  Created by Bof on 01/06/23.
//

import Foundation
import SwiftUI

extension CardView {
    var ongoingCard: some View {
        ZStack(alignment: .center) {
            HStack(spacing: toggleSpacing()) {
                leftStrip
                    .offset(x: info.startsOpen ? 18.5 : 16.5)
                HStack(spacing: 7) {
                    toggleButton
                        .offset(x: 4.5, y: toggleOffset())
                    cardHeaderView
                }
            }.offset(x: -12)
            cardDescriptionView
                .offset(x: 12, y: descriptionYOffset())
        }
        .onHover { hover in
                        isHovered = hover
                    }
        .frame(width: 379, height: cardHeight())
        .overlay(CardRoundedShape(tl: 0, tr: 10, bl: 10, br: 10).stroke(Color.black, lineWidth:1))
    }
}
