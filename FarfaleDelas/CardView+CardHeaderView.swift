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
        ZStack(alignment: .center) {
            Rectangle()
                .frame(width: 399.86, height: 44.42)
                .cornerRadius(10)
                .foregroundColor(.white)
            
            HStack(alignment: .top) {
                activityTitle
                    .padding(.top, 9.38)
                
                HStack(alignment: .top, spacing: 11.26) {
                    HStack(spacing: 4.98) {
                        Divider()
                            .frame(width: 24.9)
                        activityDuration
                            .padding(.top, 9.38)
                    }
                    HStack(spacing: 4.98) {
                        Divider()
                            .frame(width: 24.9)
                        activityETA
                            .padding(.top, 9.38)
                    }
                }
                
                Spacer()

                    
            }.frame(maxHeight: 23.72)
        }.foregroundColor(.black)
    }
    
    //   elementos do Card Fechado
    
    // titulo
    var activityTitle: some View {
        VStack(alignment: .leading) {
            
            Text("Atividade")
                .font(getFont(.cardInfoSmall))
            

            TextField(
                                "Nomeie sua atividade",
                                text: $info.atividadeText,
                                onEditingChanged: { changed in
                                    // ação quando editar o texto
                                },
                                onCommit: {
                                    isOpen.toggle()
                                    
                                }
                            )
            .frame(maxWidth: 164)
        }.frame(height:23.72)
    }
    
    //picker de duracao
    var activityDuration: some View {
        VStack(alignment: .leading) {
            Text("Tempo da atividade")
                .font(getFont(.cardInfoSmall))
            
            Picker("Duração", selection: $info.duration) {
                        ForEach(info.timeBoxes, id: \.self) {
                            Text("\($0)m")
                                .foregroundColor(.black)
                                .font(getFont(.cardInfo))
                            
                        }
                    }
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

