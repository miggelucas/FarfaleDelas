//
//  SideView.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 25/05/23.
//

import SwiftUI


struct SideView: View {

    @StateObject var viewModel: SideViewModel = SideViewModel()

    
    var body: some View {
        VStack(spacing: 50) {
            HStack {
                Spacer()
                
                Text("Infos")
                    .font(.headline)
                
                
                Button {
                    //viewModel.settingsPressed()
                } label: {
                    Image(systemName: "gear")
                }
                
            
            }
            .padding(.horizontal)
            
            ClockView(timePassedRatio: viewModel.timeRatio,
                      remainingTime: viewModel.timeFormatted)
                .frame(width: 200, height: 200)
                
            
            
            Text("Current Task")
                .font(.headline)
            
            
            VStack(spacing: 10) {
                Text("23:12")
                
                Text("Término Estimado")
            }
            
            
            VStack{
                switch viewModel.state {
                case .idle:
                    Button("Iniciar") {
                        viewModel.state = .playing
                    }
                    
                case .playing:
                    Button("Pausar") {
                        viewModel.state = .paused
                    }
                    
                    Button("Próximo") {
                        
                        
                    }
                    
                case .paused:
                    Button("Retomar") {
                        viewModel.state = .playing
                        
                    }
                    
                    Button("Próximo") {
                        
                        
                    }
                }
                
            }
        }
        .frame(width: 300, height: 900)
    }
}

struct SideView_Previews: PreviewProvider {
    static var previews: some View {
        SideView()
    }
}
