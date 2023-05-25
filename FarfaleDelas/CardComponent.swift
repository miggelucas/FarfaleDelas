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
    @State var isOpen: Bool = false

    
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
        VStack(alignment: .leading) {
            HStack {
                toggleButton
                TextField(
                  "Hint Text",
                  text: $info.atividadeText,
                  onEditingChanged: { changed in
                    //acao quando editar o texto
                  },
                  onCommit: {
                      isOpen.toggle()
                  }
                )
                .frame(width: 500)
                .padding()

                Button("Delete", action: {
                    // deletar card da lista de informacoes
                })
            }
            
            HStack {
                VStack {
                    Text("Duração: \(info.duration)")
                    Picker("", selection: $info.duration) {
                        ForEach(info.timeBoxes, id: \.self) {
                                       Text($0)
                                   }
                               }
                            .frame(width: 100)
                               .pickerStyle(.menu)
                }
                VStack {
                    Text("Cor")
                    Picker("", selection: $info.setColor) {
                        ForEach(info.colors, id: \.self) {
                                       Text($0)
                                   }
                               }
                               .frame(width: 100)
                               .pickerStyle(.menu)
                }
            }
        }
    }
    
    var closedCard: some View {
        HStack {
            toggleButton
            Text(info.atividadeText)
                .frame(width: 500)
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
