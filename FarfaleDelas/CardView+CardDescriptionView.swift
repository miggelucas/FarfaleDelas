//
//  CardView+CardDescriptionView.swift
//  FarfaleDelas
//
//  Created by Bof on 25/05/23.
//

import Foundation
import SwiftUI

extension CardView {
    // Card Aberto
    
    var cardDescriptionView: some View {
            VStack(alignment: .leading, spacing: 0.38) {
                Text("Descrição da atividade")
                
                TextEditor(text: $info.description)
                    .scrollContentBackground(.hidden)
                    .background(.clear)
                    .lineLimit(2...6)
                    .frame(width: 180, height: 40)
                    .border(.gray, width: 0.4)
                    .opacity(0.4)
                    .cornerRadius(4)
                    .foregroundColor(.black)

                    
            }
            .foregroundColor(.black)
            .font(getFont(.cardInfoSmall))
        .opacity(isOpen ? 1.0 : 0.0)
//        .frame(maxWidth: 420)
    }
}
