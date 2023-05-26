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
            
            // top
            VStack {
                ZStack {
                    Text("Infos")
                        .font(.title)
                    
                    Spacer()
                    
                    HStack {
                        
                        Spacer()
                        
                        Button {
                            //viewModel.settingsPressed()
                        } label: {
                            Image(systemName: "gear")
                        }
                        
                        
                    }.padding(.horizontal)
                    
                }
                
            }
            
            
            
            ClockView(timePassedRatio: viewModel.timeRatio,
                      remainingTime: viewModel.timeRemainingFormatted)
            .frame(width: 200, height: 200)
            
            
            
            Text("Current Task")
                .font(.headline)
            
            
            VStack(spacing: 10) {
                Text(viewModel.currentTimeWithAddedSeconds())
                
                Text("Término Estimado")
            }
            
            
            VStack{
                switch viewModel.state {
                case .idle:
                    CommonButtonView(style: .Start) {
                        viewModel.state = .playing
                    }
                    
                case .playing:
                    CommonButtonView(style: .Pause) {
                        viewModel.state = .paused
                    }
                    
                    CommonButtonView(style: .Skip) {
                        
                        
                    }
                    
                case .paused:
                    CommonButtonView(style: .Resume) {
                        viewModel.state = .playing
                        
                    }
                    
                    CommonButtonView(style: .Skip) {
                        
                        
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
