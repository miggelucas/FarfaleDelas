//
//  ClockView.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 25/05/23.
//

import SwiftUI

struct ClockView: View {
    
    @StateObject var viewModel: ClockViewModel = ClockViewModel()

    
    var body: some View {
        VStack {
            ZStack {
                // Círculo de fundo
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 10)

                
                // Setor circular que se expande
                Circle()
                    .trim(from: 0, to: CGFloat(viewModel.timeRatio))
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.linear(duration: 1), value: viewModel.secondsPassed)
                
                
                Text(viewModel.timeFormatted)
                    .font(.largeTitle)
                    .foregroundColor(.black)
            }
            
        }
        .padding()

    }
}
struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}
