//
//  ContentView.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 25/05/23.
//

import SwiftUI

struct ContentView: View {
    
    //todo conteúdo que tá aqui é inútil pro nosso app e pode ser removido, só ta aqui de placeholder =)
    
    @State var randomNumber: String = ""
    @State var initialRange: Int = 0
    @State var finalRange: Int = 10
    
    var body: some View {
        HStack(spacing: 0) {
            ActivitiesList()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
