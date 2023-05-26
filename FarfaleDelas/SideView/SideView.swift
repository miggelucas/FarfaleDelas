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
                    Text("Timer")
                        .font(.title)
                    
                    Spacer()
                    
                    HStack {
                        
                        Spacer()
                        
                        Button {
                            viewModel.settingButtonPressed()
                        } label: {
                            Image(systemName: "gear")
                        }
                        
                        
                    }.padding(.horizontal)
                    
                }
                
            }
            
            // Clock and Task Name
            VStack {
                ClockView(timePassedRatio: viewModel.timeRatio,
                          remainingTime: viewModel.timeRemainingFormatted)
                .frame(width: 200, height: 200)
                
                
                
                Text(viewModel.currentTaskName)
                    .font(.headline)
            }
            
            
            VStack(spacing: 10) {
                Text(viewModel.estimatedDoneTime)
                    .font(.title)
                
                Text("termino Estimado")
            }
            
            
            VStack{
                switch viewModel.state {
                case .idle:
                    CommonButtonView(style: .Start) {
                        viewModel.startButtonPressed()
                    }
                    
                case .playing:
                    if viewModel.clockRunning {
                        CommonButtonView(style: .Pause) {
                            viewModel.pauseButtonPressed()
                        }
                    } else {
                        CommonButtonView(style: .Resume) {
                            viewModel.resumeButtonPressed()
                        }
                    }
                    
    
                    CommonButtonView(style: .Skip) {
                        
                        
                    }
                    
                }
                
            }
            
            Spacer()
            
        }
        .padding(.top, 30)
        .frame(width: 300, height: 900)
    }
}

struct SideView_Previews: PreviewProvider {
    static var previews: some View {
        SideView()
    }
}
