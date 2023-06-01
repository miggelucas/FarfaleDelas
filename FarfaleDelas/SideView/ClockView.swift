//
//  ClockView.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 25/05/23.
//

import SwiftUI

struct ClockView: View {
    
    var timePassedRatio: Float
    var remainingTime: String
    var strokeColor: Color
    var strokeThickness: CGFloat
    
    init(timePassedRatio: Float, remainingTime: String, strokeColor: Color, strokeThickness: CGFloat = 5) {
        self.timePassedRatio = timePassedRatio
        self.remainingTime = remainingTime
        self.strokeColor = strokeColor
        self.strokeThickness = strokeThickness
    }

    
    var body: some View {
        VStack {
            ZStack {
                // Círculo de fundo
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: strokeThickness)

                
                // Setor circular que se expande
                Circle()
                    .trim(from: 0, to: CGFloat(timePassedRatio))
                    .stroke(strokeColor, style: StrokeStyle(lineWidth: strokeThickness,
                                                            lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.linear(duration: 1), value: timePassedRatio)
                
                
                Text(remainingTime)
                    .font(.subheadline)
                    .foregroundColor(Color(ColorConstant.PRIMARY_WHITE))
            }
            
        }

    }
}
struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView(timePassedRatio: 0.5, remainingTime: "16:20", strokeColor: .pink)
            .frame(width: 105, height: 105)
    }
}
