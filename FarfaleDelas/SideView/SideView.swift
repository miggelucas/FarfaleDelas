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
                          remainingTime: viewModel.timeRemainingFormatted,
                          strokeColor: viewModel.taskColor
                )
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
                    CommonButtonView(style: .Start, buttonColor: viewModel.taskColor) {
                        viewModel.startButtonPressed()
                    }
                    
                case .playing:
                    if viewModel.clockRunning {
                        CommonButtonView(style: .Pause, buttonColor: viewModel.taskColor) {
                            viewModel.pauseButtonPressed()
                        }
                    } else {
                        CommonButtonView(style: .Resume, buttonColor: viewModel.taskColor) {
                            viewModel.resumeButtonPressed()
                        }
                    }
                    
    
                    CommonButtonView(style: .Skip, buttonColor: viewModel.taskColor) {
                        
                        
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
