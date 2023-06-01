//
//  CardView+Functions.swift
//  FarfaleDelas
//
//  Created by Bof on 29/05/23.
//

import Foundation
import SwiftUI

extension CardView {
    
    func dateFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }
    
    func calculateETA() -> some View {
        let updateEta: Date = info.eta
        var etaDisplay: some View {
            Text("\(updateEta, formatter: dateFormatter())")
                .font(getFont(.cardInfo))
        }
        
        eta = updateEta
        return etaDisplay
    }
}
