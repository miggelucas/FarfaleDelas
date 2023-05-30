//
//  CardView.swift
//  FarfaleDelas
//
//  Created by ditthales on 26/05/23.
//

import SwiftUI

struct CardView: View{
 
    @State var info: CardInformation
    @State var isOpen: Bool = false

    let actionForDeleteButton: ()->()

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
                .frame(width: 200)
                .padding(.horizontal)

                Button("Delete",role: .destructive, action: {
                    actionForDeleteButton()
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
                .frame(width: 309)
        }
    }
}

extension CardView {
    var toggleButton: some View {
        Button("Toggle", action: {
            isOpen.toggle()
        }).foregroundColor(.white)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(info: CardInformation()){
            
        }
    }
}

