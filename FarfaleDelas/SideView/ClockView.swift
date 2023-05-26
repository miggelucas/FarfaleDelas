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

    
    var body: some View {
        VStack {
            ZStack {
                // Círculo de fundo
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 10)

                
                // Setor circular que se expande
                Circle()
                    .trim(from: 0, to: CGFloat(timePassedRatio))
                    .stroke(strokeColor, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.linear(duration: 1), value: timePassedRatio)
                
                
                Text(remainingTime)
                    .font(.largeTitle)
            }
            
        }
        .padding()

    }
}
struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView(timePassedRatio: 0.5, remainingTime: "16:20", strokeColor: .pink)
    }
}
