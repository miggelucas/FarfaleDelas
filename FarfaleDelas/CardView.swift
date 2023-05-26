//
//  CardView.swift
//  FarfaleDelas
//
//  Created by Bof on 25/05/23.
//

import Foundation
import SwiftUI

struct CardView: View {
    @State var info: CardInformation
    @State var isOpen: Bool = true
    @State var editingTitle: Bool = true
    
    @State var eta: Date = .now
    
    func calculateETA() -> some View {
        var updateEta: Date = .now.addingTimeInterval(Double(info.duration)! * 60)
        var etaDisplay: some View {
            Text("\(updateEta, formatter: dateFormatter)")
                .font(getFont(.cardInfo))
        }
        eta = updateEta
        return etaDisplay
    }

        
    var dateFormatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .cornerRadius(16)
                .foregroundColor(info.setColor)
            HStack {
                toggleButton
                cardHeaderView
            }
            cardDescriptionView
                .offset(x: -74, y: isOpen ? 52 : 0)
        }.frame(width: 420, height: isOpen ? 104.78 : 0)
    }
}
