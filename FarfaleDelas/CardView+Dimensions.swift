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
        return isOpen ? 20 : 0
    }
    
    func descriptionOpacity() -> Double {
        return isOpen ? 1.0 : 0.0
    }
    
    func headerYOffset() -> CGFloat {
        return isOpen ? -20 : 0
    }
    
    func cardHeight() -> CGFloat {
        return isOpen ? 105 : 50
    }
    
    func stripHeight() -> CGFloat {
        return isOpen ? 105 :  50
    }
    
    func toggleIcon() -> (Angle, CGFloat, CGFloat) {
            // text, width and height respectively
        return (isOpen ? Angle(degrees: 90) : Angle(degrees: 0), isOpen ? 14 : 8.07, isOpen ? 8.07 : 14)
        }
    
    func toggleSpacing() -> CGFloat {
        return isOpen ? 5 : 9
    }
    
    func toggleOffset() -> CGFloat {
        return isOpen ? -20 : 0
    }
}
