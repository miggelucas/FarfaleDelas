//
//  CardView+Strip.swift
//  FarfaleDelas
//
//  Created by Bof on 29/05/23.
//

import Foundation
import SwiftUI

extension CardView {
    var leftStrip: some View {
        CardRoundedShape(tl: 0, tr: 0, bl: 10, br: 0)
            .fill(isHovered ? Color.purple : Color.gray)
            .frame(width: 8, height: stripHeight())
    }
}
