//
//  PauseButton.swift
//  FarfaleDelas
//
//  Created by ditthales on 29/05/23.
//

import SwiftUI

struct PauseButton: View {
    
    let action: ()->()
    
    var body: some View {
        Button{
            action()
        }label: {
            Image("pauseButton")
        }.buttonStyle(.plain)
    }
}

struct PauseButton_Previews: PreviewProvider {
    static var previews: some View {
        PauseButton(){
            
        }
    }
}
