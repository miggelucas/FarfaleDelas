//
//  CardView+CardHeaderComponents.swift
//  FarfaleDelas
//
//  Created by Bof on 29/05/23.
//

import Foundation
import SwiftUI

extension CardView {
    // titulo
    var activityTitle: some View {
        VStack(alignment: .leading) {
            
            Text("Atividade")
                .font(getFont(.cardInfoSmall))
            
            
            TextField(
                "Nomeie sua atividade",
                text: $info.atividadeText
//                onCommit: {
//                    isOpen.toggle()
//                }
            )
            .disabled(info.cardType == .pause ? true : false)
            .font(getFont(.cardInfo))
            .textFieldStyle(.plain)
            .onHover { hover in
                            editingTitle = hover
                        }
            .background(
                Rectangle()
                    .stroke(editingTitle ? Color.purple : Color.clear, lineWidth: 1)
                    .frame(width: 147, height: 18)
//                    .padding()
            )
            .frame(maxWidth: 147)
        }.frame(height:23.72)
    }
    
    
    
    //picker de duracao
    var activityDuration: some View {
        VStack(alignment: .leading) {
            Text("Tempo da atividade")
                .font(getFont(.cardInfoSmall))
            
            Picker("Duração", selection: $info.duration) {
                ForEach(info.timeBoxes, id: \.self) {
                    Text("\($0) min")
                        .foregroundColor(.black)
                        .font(getFont(.cardInfo))
                    
                }
            }.frame(width: 82, height: 19)
            .labelsHidden()
            .pickerStyle(.menu)
        }
    }
    
    
    
    //tempo estimado
    var activityETA: some View {
        VStack(alignment: .leading, spacing: 4.57) {
            Text("Hora do término")
                .font(getFont(.cardInfoSmall))
            
            calculateETA()
                .font(getFont(.cardInfo))
            
        }
    }
    
    var colorPicker: some View {
        ColorPicker("Set the background color", selection: $info.setColor, supportsOpacity: false)
    }
}
