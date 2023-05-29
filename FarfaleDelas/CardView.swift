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

    @State var eta: Date = .now
    
    let actionForDeleteButton: () -> ()
    
    var body: some View {
            ZStack(alignment: .center) {
                HStack(spacing: spacingA ) {
                    leftStrip
                    HStack(spacing: 20) {
                        toggleButton
                        cardHeaderView
                    }
                }.offset(x: -12)
                cardDescriptionView
                    .offset(x: -54, y: isOpen ? 20 : 0)
            }
            .onHover { hover in
                            isHovered = hover
                        }
            .frame(width: 379, height: isOpen ? 105 : 50)
            .background(CardRoundedShape(tl: 0, tr: 10, bl: 10, br: 10).fill(Color.white))
    }
    
    
    private var spacingA: CGFloat {
        return isOpen ? 8 : 14
    }
    
}
