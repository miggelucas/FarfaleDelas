//
//  CardView.swift
//  FarfaleDelas
//
//  Created by ditthales on 26/05/23.
//

import SwiftUI

struct CardView: View, Hashable {
    
    static func == (lhs: CardView, rhs: CardView) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
    let id = UUID()
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

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(info: CardInformation())
    }
}

