//
//  SideView.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 25/05/23.
//

import SwiftUI


struct SideView: View {
    
    @ObservedObject var viewModel: SideViewModel = SideViewModel()
    
    let primaryBlackColor = Color(ColorConstant.PRIMARY_BLACK)
    let primaryWhiteColor = Color(ColorConstant.PRIMARY_WHITE)
    let secundaryPinkColor = Color(ColorConstant.SECONDARY_PINK)
    
    
    var body: some View {
        
        ZStack {
            primaryBlackColor
            
            VStack {
                
                timeAndSettingsHeader
                    .padding(.bottom, 32)
                
                clockAndTask
                    .padding(.bottom, 46)
                
                
                estimatedDoneTime
                
                Spacer()
                
                genericBottonButtons
                
            }
            .frame(width: 133, height: 536)
        }
        
        
    }
    
    
    
    
    
    private var timeAndSettingsHeader: some View {
        VStack {
            ZStack {
                Text("Informações")
                    .font(.headline)
                    .foregroundColor(primaryWhiteColor)
                
                
                HStack {
                    
                    Spacer()
                    
                    Button {
                        viewModel.settingButtonPressed()
                    } label: {
                        Image(systemName: "gear")
                            .foregroundColor(secundaryPinkColor)
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
                .foregroundColor(primaryWhiteColor)
                .font(.callout)
                .padding(.bottom, 8)
            
            Text(viewModel.currentTaskDescription)
                .foregroundColor(primaryWhiteColor)
                .font(.caption)
                .padding(.horizontal)
        }
        .multilineTextAlignment(.center)
    }
    
    private var estimatedDoneTime: some View {
        VStack(spacing: 4) {
            
            ZStack {
                Text(viewModel.estimatedDoneTime)
                    .foregroundColor(primaryWhiteColor)
                    .font(.title)
                
                if viewModel.timePlanExceeded {
                    Image(systemName: "exclamationmark.circle.fill")
                        .foregroundColor(.red)
                        .frame(width: 11, height: 11)
                        .offset(x: 40, y: -15)
                }
                
            }
            
            Text("Horário de Término")
                .foregroundColor(primaryWhiteColor)
            
            if viewModel.timePlanExceeded {
                Button {
                    //                viewModel.changeTimePlan(
                } label: {
                    Text("Alterar tempo Planejado")
                        .foregroundColor(secundaryPinkColor)
                        .font(.caption)
                        .underline()
                }
                .buttonStyle(.plain)
            }
            
            
        }
    }
    
    
    private var genericBottonButtons: some View {
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
    
}





struct SideView_Previews: PreviewProvider {
    static var previews: some View {
        SideView()
    }
}
