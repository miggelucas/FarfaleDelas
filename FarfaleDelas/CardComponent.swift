//
//  CardComponent.swift
//  FarfaleDelas
//
//  Created by Bof on 25/05/23.
//

import Foundation
import SwiftUI

struct CardInformation {
    var atividadeText: String = "Nome da atividade"
    var duration: String = "30"
    var setColor: String = "Green"
    
    let colors = ["Red", "Green", "Blue", "Black", "Tartan"]
    let timeBoxes = ["20", "30", "45", "60", "90", "120"]

    
}

struct CardView: View {
    @State var info: CardInformation
    @State var isOpen: Bool = true

    
    var body: some View {
        if isOpen {
            openCard
        }
        else {
            closedCard
        }
    }
}

extension CardView {
    var openCard: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            
            VStack(alignment: .leading) {
                HStack {
                    toggleButton
                    TextField(
                      "Insira o nome",
                      text: $info.atividadeText,
                      onEditingChanged: { changed in
                        //acao quando editar o texto
                      },
                      onCommit: {
                          isOpen.toggle()
                      }
                    )
                    .frame(width: 300)
                    .padding()

                    Button("Delete", action: {
                        // deletar card da lista de informacoes
                    })
                }
                
                HStack(alignment: .center, spacing: 120) {
                        Picker("Duração", selection: $info.duration) {
                            ForEach(info.timeBoxes, id: \.self) {
                                           Text($0)
                                       }
                                   }
                                .frame(width: 140)
                                   .pickerStyle(.menu)
                        Picker("Cor:", selection: $info.setColor) {
                            ForEach(info.colors, id: \.self) {
                                           Text($0)
                                       }
                                   }
                                   .frame(width: 200)
                                   .pickerStyle(.menu)
                }
            }
        }
    }
    
    var closedCard: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                HStack(spacing: 20) {
                toggleButton
                Text(info.atividadeText)
                    .frame(width: 300)
            }
        }
    }
}

extension CardView {
    var toggleButton: some View {
        Button("Toggle", action: {
            isOpen.toggle()
        })
    }
}
