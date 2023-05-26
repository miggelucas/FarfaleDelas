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
    let action: () -> Void
    
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
        Button(label) {
            action()
        }
    }
}

struct CommonButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CommonButtonView(style: .Done, action: {})
    }
}
