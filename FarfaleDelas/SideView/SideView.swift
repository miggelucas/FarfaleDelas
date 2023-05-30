//
//  SideView.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 25/05/23.
//

import SwiftUI


struct SideView: View {
    
    @ObservedObject var viewModel: SideViewModel = SideViewModel()
    
    let primaryColor: Color = .pink
    
    
    var body: some View {
        VStack() {
            
            timeAndSettingsHeader
                .padding(.bottom, 32)
            
            clockAndTask
                .padding(.bottom, 46)
            
            
            estimatedDoneTime
            
            Spacer()
            
            VStack(spacing: 8) {
                
                CommonButtonView(style: viewModel.topCommomButtonStyle) {
                    viewModel.topCommomButtonPressed()
                }
                
                if viewModel.state == .playing {
                    CommonButtonView(style: viewModel.bottonCommonButtonStyle) {
                        viewModel.bottonCommonButtonPressed()
                    }
                }
                
                
            }
        }
        .frame(width: 133, height: 536)
        
        
    }
    
    private var estimatedDoneTime: some View {
        VStack(spacing: 4) {
            Text(viewModel.estimatedDoneTime)
                .font(.title)
            
            Text("Horário de Término")
        }
    }
    
    private var timeAndSettingsHeader: some View {
        VStack {
            ZStack {
                Text("Informações")
                    .font(.headline)
                    .foregroundColor(primaryColor)
                
                
                HStack {
                    
                    Spacer()
                    
                    Button {
                        viewModel.settingButtonPressed()
                    } label: {
                        Image(systemName: "gear")
                            .foregroundColor(primaryColor)
                    }
                    .buttonStyle(.plain)
                    
                }
                
            }
            
        }
        
    }
    
    
    private var clockAndTask: some View {
        VStack {
            ClockView(timePassedRatio: viewModel.timeRatio,
                      remainingTime: viewModel.timeRemainingFormatted,
                      strokeColor: viewModel.taskColor
            )
            .frame(width: 105, height: 105)
            .padding(.bottom, 16)
            
            
            Text(viewModel.currentTaskName)
                .font(.callout)
                .padding(.bottom, 8)
            
            Text(viewModel.currentTaskDescription)
                .font(.caption)
                .padding(.horizontal)
        }
        .multilineTextAlignment(.center)
    }
    
}





struct SideView_Previews: PreviewProvider {
    static var previews: some View {
        SideView()
    }
}
