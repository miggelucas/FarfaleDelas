//
//  CommonButtonView.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 25/05/23.
//

import SwiftUI

struct CommonButtonView: View {
    enum Style {
        case Start, Pause, Resume, Skip, Done
    }
    
    let style: Style
    let buttonColor: Color
    let action: () -> Void
    
    init(style: Style, buttonColor: Color = .pink, action: @escaping () -> Void) {
        self.style = style
        self.buttonColor = buttonColor
        self.action = action
    }

    var label: String {
        switch style {
        case .Start:
            return "Iniciar"
        case .Pause:
            return "Pausar"
        case .Resume:
            return "Retomar"
        case .Skip:
            return "Próximo"
        case .Done:
            return "Concluir"
        }
    }
    
    
    var body: some View {
        if style == .Skip || style == .Done {
            Button {
                action()
            } label: {
                Text(label)
                    .font(.headline)
                    .fontWeight(.regular)
                    .frame(width: 125, height: 40)
                    .background(buttonColor)
                    .cornerRadius(15)
                
            }
            .buttonStyle(.plain)
            
        } else {
            Button {
                action()
            } label: {
                Text(label)
                    .font(.headline)
                    .fontWeight(.black)
                    .frame(width: 125, height: 40)
                    .background(buttonColor)
                    .cornerRadius(15)
                
            }
            .buttonStyle(.plain)
        }
        
        

    }
}

struct CommonButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CommonButtonView(style: .Done, buttonColor: .pink, action: {})
    }
}
