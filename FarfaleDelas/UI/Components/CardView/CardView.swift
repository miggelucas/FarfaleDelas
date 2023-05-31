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
            .overlay(CardRoundedShape(tl: 0, tr: 10, bl: 10, br: 10).stroke(Color.black, lineWidth:1))
    }
    
}
