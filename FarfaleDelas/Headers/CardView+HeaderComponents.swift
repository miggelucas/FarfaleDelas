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
            )
            .disabled(info.cardType == .pause ? true : false)
            .font(getFont(.cardInfo))
            .textFieldStyle(.plain)
            .foregroundColor(editingTitle ? .black : .gray)
            .onHover { hover in
                            editingTitle = hover
                        }
            .background(
                Rectangle()
                    .stroke(editingTitle ? Color.purple : Color.clear, lineWidth: 1)
                    .frame(width: 147, height: 18)
            )
            .frame(maxWidth: 147)
        }.frame(height:23.72)
    }
    
    
    
    //picker de duracao
    var activityDuration: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Tempo da atividade")
                .font(getFont(.cardInfoSmall))
            
            Picker("Duração", selection: $info.duration) {
                ForEach(info.timeBoxes, id: \.self) {
                    Text("\($0) min")
                        .foregroundColor(.black)
                        .font(getFont(.cardInfo))
                    
                }.offset(y: -2)
            }.frame(width: 82, height: 19)
            .labelsHidden()
            .accentColor(.purple)
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
            ZStack {
                Circle()
                    .foregroundColor(.purple)
                    .frame(width: 14)
                    .opacity(hoveringColor ? 1.0 : 0.0)
                
                Circle()
                    .foregroundColor(info.setColor)
                    .frame(width: 12)
                    .onHover { hover in
                        hoveringColor = hover
                    }
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.15)) {
                            editingColor.toggle()
                        }
                    }
                VStack {
                    ForEach(info.colorOptions, id: \.self) { color in
                        if color != info.setColor {
                            var overlay: Bool = false
                            
                            Button("􀀁", action: {
                                info.setColor = color
                                editingColor.toggle()
                            })
                            .font(getFont(.cardInfo))
                            .foregroundColor(color)
                            .buttonStyle(.plain)
                            .onHover {hover in
                                overlay = hover
                            }
//                            .overlay(content: {
//                                Circle()
//                                    .foregroundColor(.black)
//                                    .frame(width: 10)
//                                    .opacity(overlay ? 0.8 : 0.0)
//                            })
                        }
                    }
                }
            .offset(y: editingColor ? 22 : -10)
            .frame(height: editingColor ? 32 : 12)
            .opacity(editingColor ? 1.0 : 0.0)
            }
    }
}
