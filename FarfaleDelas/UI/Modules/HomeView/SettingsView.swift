//
//  SettingsView.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 30/05/23.
//

import SwiftUI


struct SettingsView: View {
    
    @Binding var userSettings: UserSettingsProtocol
    
    let workingMinutesOptions: [WorkingMinutesOption] = WorkingMinutesOption.allCases
    var backButtonPressed: () -> Void

    
    var body: some View {
        
        ZStack {
            Color(ColorConstant.PRIMARY_BLACK)
            
            VStack {
                ZStack {
                    Text("Configurações")
                        .foregroundColor(Color(ColorConstant.PRIMARY_WHITE))
                    
                    HStack {
                        Button {
                            backButtonPressed()
                        } label: {
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(Color(ColorConstant.SECONDARY_PINK))
                        }
                        .buttonStyle(.plain)
                        
                        Spacer()
                        
                    }
                    .padding()
                }
                
                Form {
                    Section("Preferências") {
                        Toggle("Ativar touchBar", isOn: $userSettings.isTouchBarEnable)
                        Toggle("Notificações", isOn: $userSettings.isNotificationsEnable)
                        Toggle("Início automático do próximo timer", isOn: $userSettings.isAutoStartNextEnable)
                        Toggle("Ativar Widget", isOn: $userSettings.iscClockWidgetEnable)
                    }
                    
                    Section("Limite") {
                        Picker("Tempo total de Trabalho em minutos", selection: $userSettings.workingMinutesTime) {
                            ForEach(workingMinutesOptions, id: \.self) { option in
                                Text(option.rawValue).tag(option.value)
                                
                            }
                            
                        }
                    }
                }
                .tint(Color(ColorConstant.SECONDARY_PINK))
                .foregroundColor(Color(ColorConstant.PRIMARY_WHITE))
                .toggleStyle(.switch)
                .formStyle(.grouped)
                .pickerStyle(.menu)
                
                
            }
            
            
            .frame(width: 632, height: 596)
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(userSettings: .constant(dummyUserSettings()), backButtonPressed: {})
    }
}
