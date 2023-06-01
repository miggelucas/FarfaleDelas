//
//  FinishedCard.swift
//  FarfaleDelas
//
//  Created by Bof on 01/06/23.
//

import Foundation
import SwiftUI

extension CardView {
    var finishedCard: some View {
        ZStack(alignment: .center) {
            HStack(spacing: toggleSpacing()) {
                leftStrip
                    .offset(x: info.cardType == .pause ? 4 : 7)
                HStack(spacing: 7) {
                    toggleButton
                        .disabled(true)
                        .offset(x: 4.5, y: toggleOffset())
                    cardHeaderView
                }
                .offset(y: info.cardType == .activity ? 20 : 0)
            }
        }
        .frame(width: 379, height: 50)
        .overlay(CardRoundedShape(tl: 0, tr: 10, bl: 10, br: 10).stroke(Color(ColorConstant.SECONDARY_PINK_HOVER), lineWidth:1))
    }
}
