//
//  CardComponent.swift
//  FarfaleDelas
//
//  Created by Bof on 25/05/23.
//

import Foundation
import SwiftUI

struct CardView: View {
    @State var info: CardInformation
    @State var isOpen: Bool = true

    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .cornerRadius(16)
                .foregroundColor(.white)
            openCard
                .offset(y: isOpen ? 44 : 0)
            closedCard
        }.frame(width: 420, height: isOpen ? 88 : 0)
    }
}

extension CardView {
    // Card Aberto

    var openCard: some View {
        ZStack {
            VStack(alignment: .leading) {
//                HStack {
//                    Button("Delete", action: {
//                       //  deletar card da lista de informacoes
//                    })
//                }
                
                HStack(alignment: .center, spacing: 120) {
                    Picker("Duração", selection: $info.duration) {
                        ForEach(info.timeBoxes, id: \.self) {
                            Text($0)
                        }
                    }
                    .frame(width: 120)
                    .pickerStyle(.menu)
                    Picker("Cor:", selection: $info.setColor) {
                        ForEach(info.colors, id: \.self) {
                            Text($0)
                        }
                    }
                    .frame(width: 100)
                    .pickerStyle(.menu)
                }
            }
        }
        .frame(width: 420, height: 44)
        
    }
}

//extension CardView {
//    var titleViewer: AnyView {
//            if isOpen {
//                return AnyView (
//                    TextField(
//                    "Nomeie sua atividade",
//                    text: $info.atividadeText,
//                    onEditingChanged: { changed in
//                        // Ação quando editar o texto
//                    },
//                    onCommit: {
//                        isOpen.toggle()
//                    }
//                )
//              )
//            } else {
//                return AnyView (
//                    Text(info.atividadeText)
//                    )
//            }
//        }
//}

extension CardView {
    // Card Fechado
    var closedCard: some View {
        ZStack {
            Rectangle()
                .cornerRadius(16)
                .foregroundColor(.gray)
                HStack() {
                toggleButton
                TextField(
                    "Nomeie sua atividade",
                    text: $info.atividadeText,
                    onEditingChanged: { changed in
                        // Ação quando editar o texto
                    },
                    onCommit: {
                        isOpen.toggle()
                    }
                )
                .disabled(!isOpen)
                Spacer()

                }
        }
        .frame(width: 420, height: 44)
    }
}

extension CardView {
    var toggleButton: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.25)) {
                isOpen.toggle()
            }
        }, label: {
            VStack {
                Text(isOpen ? "􀆈" : "􀆊")
            }.frame(width: 60, height: 60)
          }
        )
        .buttonStyle(.plain)

//        Button(isOpen ? "􀆈" : "􀆊", action: {
//            withAnimation(.easeInOut(duration: 0.25)) {
//                isOpen.toggle()
//            }
//        })
//        .buttonStyle(.plain)
    }
}
