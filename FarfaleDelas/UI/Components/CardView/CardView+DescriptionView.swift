//
//  CardView+CardDescriptionView.swift
//  FarfaleDelas
//
//  Created by Bof on 25/05/23.
//

import Foundation
import SwiftUI

extension NSTextView {
    open override var frame: CGRect {
        didSet {
            insertionPointColor = .black
        }
    }
}

extension CardView {
    // Card Aberto
    
    var cardDescriptionView: some View {
        HStack(alignment: .bottom, spacing: 57) {
                TextEditor(text: $info.description)
                    .lineSpacing(4.0)
                    .foregroundColor(Color.black)
                    .scrollContentBackground(.hidden)
                    .onTapGesture {
                        editingDesc = true
                                if info.description == "\nDescrição da atividade" {
                                    info.description = ""
                                }
                              }
                    .onHover { hover in
                            editingDesc = hover
                                }
                    .background(
                        Rectangle()
                            .stroke(Color.purple, lineWidth: 2)
                            .opacity((editingDesc) ? 0.4 : 0.1)
                    )                    .lineLimit(...6)
                    .frame(width: 180, height: 40)
                    .cornerRadius(4)
                Spacer()
                
                Button("Delete", action: actionForDeleteButton).foregroundColor(Color.red)
                .buttonStyle(.plain)

        }.frame(width: 338.88)
            .font(getFont(.cardInfoSmall))
            .opacity(descriptionOpacity())
    }
}
