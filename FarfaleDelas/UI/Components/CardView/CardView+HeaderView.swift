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
        
        HStack(alignment: .center, spacing: 8) {
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
            
            colorPicker
//                .opacity(info.cardType == .activity ? 1.0 : 0.0)
                .offset(y: -4)
        }
            .offset(y: headerYOffset())
            .foregroundColor(.black)
    }
    
}
