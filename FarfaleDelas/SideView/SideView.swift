//
//  SideView.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 25/05/23.
//

import SwiftUI


struct SideView: View {
    
    @Binding var taskList: [CardInformation]
    
    @ObservedObject var viewModel: SideViewModel = SideViewModel()
    
    var settingsButtonPressed: () -> Void
    
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
                    .padding(.bottom, 20)
                
                Rectangle()
                    .foregroundColor(primaryWhiteColor)
                    .frame(height: 1)
                    .padding(.bottom, 20)
                
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
                    .font(.customPrimary(.h2))
                    .foregroundColor(primaryWhiteColor)
        
                HStack {
                    
                    Spacer()
                    
                    Button {
                        settingsButtonPressed()
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
                      strokeColor: Color(viewModel.taskColor)
            )
            .frame(width: 105, height: 105)
            .padding(.bottom, 16)
            
            
            Text(viewModel.currentTaskName)
                .foregroundColor(primaryWhiteColor)
                .font(.custumSecondary(.h4))
                .padding(.bottom, 8)
            
            Text(viewModel.currentTaskDescription)
                .foregroundColor(primaryWhiteColor)
                .font(.custumSecondary(.text))
                .padding(.horizontal)
        }
        .multilineTextAlignment(.center)
    }
    
    private var estimatedDoneTime: some View {
        VStack(spacing: 4) {
            
            ZStack {
                Text(taskList.last?.eta.formatted(date: .complete, time: .complete) ?? "")
                    .foregroundColor(primaryWhiteColor)
                    .font(.custumSecondary(.h3))
                
                if viewModel.timePlanExceeded {
                    Image(systemName: "exclamationmark.circle.fill")
                        .foregroundColor(.red)
                        .frame(width: 11, height: 11)
                        .offset(x: 40, y: -15)
                }
                
            }
            
            Text("Horário de Término")
                .foregroundColor(primaryWhiteColor)
                .font(.custumSecondary(.subTitle))
            
            if viewModel.timePlanExceeded {
                Button {
                    settingsButtonPressed()
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
        SideView(taskList: .constant([CardInformation()]), settingsButtonPressed: {})
    }
}
