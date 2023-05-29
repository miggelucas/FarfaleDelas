//
//  CardView+CardHeaderView.swift
//  FarfaleDelas
//
//  Created by Bof on 25/05/23.
//

import Foundation
import SwiftUI

extension CardView {
    // Card Fechado
    
    var cardHeaderView: some View {
        
            HStack(alignment: .top) {
                activityTitle
                
                HStack(alignment: .top, spacing: 4) {
                        Divider()
                            .frame(height: 24.9)
                        activityDuration
                    }
                HStack(alignment: .top, spacing: 4) {
                        Divider()
                            .frame(height: 24.9)
                        activityETA
                    }
                    
            }
            .offset(y: isOpen ? -20 : 0)
            .foregroundColor(.black)
    }
    
}

