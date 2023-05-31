//
//  CardView.swift
//  FarfaleDelas
//
//  Created by ditthales on 26/05/23.
//
//
//import SwiftUI
//
//struct CardView: View{
//
//    @State var info: CardInformation
//    @State var isOpen: Bool = false
//
//    let actionForDeleteButton: ()->()
//
//    var body: some View {
//        if isOpen {
//            openCard
//        }
//        else {
//            closedCard
//        }
//    }
//}
//
//extension CardView {
//    var openCard: some View {
//        VStack(alignment: .leading) {
//            HStack {
//                toggleButton
//                TextField(
//                  "Hint Text",
//                  text: $info.atividadeText,
//                  onEditingChanged: { changed in
//                    //acao quando editar o texto
//                  },
//                  onCommit: {
//                      isOpen.toggle()
//                  }
//                )
//                .frame(width: 200)
//                .padding(.horizontal)
//
//                Button("Delete",role: .destructive, action: {
//                    actionForDeleteButton()
//                })
//
//            }
//
//            HStack {
//                VStack {
//                    Text("Duração: \(info.duration)")
//                    Picker("", selection: $info.duration) {
//                        ForEach(info.timeBoxes, id: \.self) {
//                                       Text($0)
//                                   }
//                               }
//                            .frame(width: 100)
//                               .pickerStyle(.menu)
//                }
//                VStack {
//                    Text("Cor")
//                    Picker("", selection: $info.setColor) {
//                        ForEach(info.colors, id: \.self) {
//                                       Text($0)
//                                   }
//                               }
//                               .frame(width: 100)
//                               .pickerStyle(.menu)
//                }
//            }
//        }
//    }
//
//    var closedCard: some View {
//        HStack {
//            toggleButton
//            Text(info.atividadeText)
//                .frame(width: 309)
//        }
//    }
//}
//
//extension CardView {
//    var toggleButton: some View {
//        Button("Toggle", action: {
//            isOpen.toggle()
//        }).foregroundColor(.white)
//    }
//}
//
//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(info: CardInformation()){
//
//        }
//    }
//}


//
//  CardView.swift
//  FarfaleDelas
//
//  Created by Bof on 25/05/23.
//

import Foundation
import SwiftUI

struct CardView: View {
    @State var info: CardInformation
    
    @State var isOpen: Bool = true // toggla pra abrir e fechar card
    @State var isHovered: Bool = false // altera cor do strip
    
    @State var editingTitle: Bool = false // titulo esta sendo editado?
    @State var editingDesc: Bool = false // desc esta sendo editada?
    
    @State var hoveringColor: Bool = false
    @State var editingColor: Bool = false

    @State var eta: Date = .now
    
    let actionForDeleteButton: () -> ()
    
    var body: some View {
            ZStack(alignment: .center) {
                HStack(spacing: toggleSpacing()) {
                    leftStrip
                        .offset(x: 2)
                    HStack(spacing: 7) {
                        toggleButton
                            .offset(y: toggleOffset())
                        cardHeaderView
                    }
                }.offset(x: -12)
                cardDescriptionView
                    .offset(x: 12, y: descriptionYOffset())
            }
            .onHover { hover in
                            isHovered = hover
                        }
            .frame(width: 379, height: cardHeight())
            .background(CardRoundedShape(tl: 0, tr: 10, bl: 10, br: 10).fill(Color.white))
    }
    
}
