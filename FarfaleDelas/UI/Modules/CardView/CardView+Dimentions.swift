//
//  CardView+Dimensions.swift
//  FarfaleDelas
//
//  Created by Bof on 30/05/23.
//

import Foundation
import SwiftUI

extension CardView {
    func descriptionYOffset() -> CGFloat {
        return info.startsOpen ? 20 : 0
    }
    
    func descriptionOpacity() -> Double {
        return info.startsOpen ? 1.0 : 0.0
    }
    
    func headerYOffset() -> CGFloat {
        return info.startsOpen ? -20 : 0
    }
    
    func cardHeight() -> CGFloat {
        return info.startsOpen ? 105 : 50
    }
    
    func stripHeight() -> CGFloat {
        return info.startsOpen && info.isOngoing ? 105 :  50
    }
    
    func toggleIcon() -> (Angle, CGFloat, CGFloat) {
            // text, width and height respectively
        return (info.startsOpen ? info.isOngoing ? Angle(degrees: 90) : Angle(degrees: 0) : Angle(degrees: 0), info.startsOpen ? 14 : 8.07, info.startsOpen ? 8.07 : 14)
        }
    
    func toggleSpacing() -> CGFloat {
        return info.startsOpen ? 16 : 18
    }
    
    func toggleOffset() -> CGFloat {
        return info.startsOpen ? -20 : 0
    }
}
