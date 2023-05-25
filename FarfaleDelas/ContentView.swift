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
        ZStack {
            Color.black
            VStack {
                HStack (alignment: .center, spacing: 30){
                    
                    Image(systemName: "shuffle")
                        .resizable()
                        .frame(width: 60, height: 60)
                    VStack(spacing: 20){
                        HStack(spacing: 30){
                            Stepper("Initial Value: \(initialRange)", value: $initialRange)
                            Stepper("Final Value: \(finalRange)", value: $finalRange)
                        }
                        Button{
                            if initialRange <= finalRange{
                                let aux = Int.random(in: initialRange...finalRange)
                                randomNumber = String(aux)
                            }
             
                        }label: {
                            Text("Generate Random Number")
                        }
                        if initialRange > finalRange{
                            Text("Final value must be higher than initial value")
                                .foregroundColor(.red)
                        }
                        if randomNumber != ""{
                            Text("Generated Number: \(randomNumber)")
                        }
                        
                    }
                }
            }
            .padding()
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
