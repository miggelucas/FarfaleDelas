//
//  CardView+FontFormatter.swift
//  FarfaleDelas
//
//  Created by Bof on 26/05/23.
//

import Foundation
import SwiftUI

enum FontType {
    case cardInfo, cardInfoSmall
}

func getFont(_ font: FontType) -> Font {
    switch font {
    case .cardInfo:
        return Font.custom("Inter", size: 9.85)

    case .cardInfoSmall:
        return Font.custom("Inter", size: 7.45)
    }
    
    
}
