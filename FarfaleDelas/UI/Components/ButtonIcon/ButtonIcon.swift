//
//  IconButton.swift
//  NumberSoup
//
//  Created by ditthales on 25/05/23.
//

import SwiftUI

struct ButtonIcon: View {
    
    var buttonType: IconButtonType
    var buttonAction: ()->()
    
    
    
    var body: some View {
        
        Button{
            buttonAction()
        }label: {
            switch buttonType {
            case .add:
                Image("addButton")
            case .settings:
                Image("settingsButton")
            case .close:
                Image("closeButton")
            }
        }.buttonStyle(.plain)
        
        
    }
    enum IconButtonType{
        case add, settings, close
    }
}



struct ButtonIcon_Previews: PreviewProvider {
    static var previews: some View {
        ButtonIcon(buttonType: .add, buttonAction: {})
    }
}
