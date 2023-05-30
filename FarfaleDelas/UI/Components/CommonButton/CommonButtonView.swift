//
//  CommonButtonView.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 25/05/23.
//

import SwiftUI

struct CommonButtonView: View {
    @State private var isHovered = false
    
    enum Style {
        case pause, resume, skip, done, newList, restart, letsBegin
    }
    
    let style: Style
    let buttonColor: Color
    let action: () -> Void
    
    let primaryPinkColor: Color = .pink
    let secundaryPinkColor: Color = .blue
    
    init(style: Style, buttonColor: Color = .pink, action: @escaping () -> Void) {
        self.style = style
        self.buttonColor = buttonColor
        self.action = action
    }
    
    var label: String {
        switch style {
        case .pause:
            return "Pausar"
        case .resume:
            return "Retomar"
        case .skip:
            return "Próximo"
        case .done:
            return "Concluir"
        case .letsBegin:
            return "Vamos Começar!"
        case .newList:
            return "Nova Lista"
        case .restart:
            return "Reiniciar"
        }
        
        
    }
    
    var body: some View {
      
        Button {
            action()
        } label: {
            if style == .skip || style == .restart {
                borderdStyleLabel
                
            } else {
                fillStyleLabel
                
            }
        }
        .buttonStyle(.plain)
        .onHover { hovered in
            isHovered = hovered
            
        }
     
        
    }
    
    private var fillStyleLabel: some View {
        Text(label)
            .font(.headline)
            .fontWeight(.regular)
            .frame(width: 136, height: 36)
            .background(isHovered ? secundaryPinkColor : primaryPinkColor)
            .cornerRadius(10)
            .shadow(color: .black, radius: 2, y: 1)
        
    }
    
    
    private var borderdStyleLabel: some View {
        Text(label)
            .font(.headline)
            .fontWeight(.black)
            .foregroundColor(isHovered ? secundaryPinkColor : primaryPinkColor)
            .frame(width: 136, height: 36)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isHovered ? secundaryPinkColor : primaryPinkColor, lineWidth: 1)
            )
            .shadow(color: .black, radius: 2, y: 1)
    }
    
    
}

struct CommonButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CommonButtonView(style: .letsBegin, buttonColor: .pink, action: {})
            .padding(50)
    }
}
