//
//  SideView.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 25/05/23.
//

import SwiftUI


struct SideView: View {
    
    @ObservedObject var viewModel: SideViewModel = SideViewModel()
    
    
    var body: some View {
        VStack(spacing: 50) {
//            Text(viewModel.currentTime.formatted(date: .complete, time: .complete))
            
            timeAndSettingsHeader
            
            clockAndTask
            
            VStack(spacing: 10) {
                Text(viewModel.estimatedDoneTime)
                    .font(.title)
                
                Text("Término Estimado")
            }
            
            
            VStack{
                
                CommonButtonView(style: viewModel.topCommomButtonStyle) {
//                    topCommomButtonPressed()
                }
                
                if viewModel.state == .playing {
                    CommonButtonView(style: viewModel.bottonCommonButtonStyle) {
                        
                    }
                }
                
                
            }
            Spacer()
        }
        .padding(.top, 30)
        .frame(width: 300, height: 900)
        .onAppear{
//            viewModel.viewDidApper()
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
                .font(.headline)
                .padding(.bottom, 8)
            
            Text(viewModel.currentTaskDescription)
                .font(.headline)
                .padding(.horizontal)
        }
    }
    
    private var timeAndSettingsHeader: some View {
        VStack {
            ZStack {
                Text("Informações")
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
        
    }
}





struct SideView_Previews: PreviewProvider {
    static var previews: some View {
        SideView()
    }
}
