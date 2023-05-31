//
//  SettingsView.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 30/05/23.
//

import SwiftUI


struct SettingsView: View {
    
    @Binding var userSettings: UserSettingsProtocol
    
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
                        Toggle("Ativar touchBar", isOn: $userSettings.touchBarEnable)
                        Toggle("Notificações", isOn: $userSettings.notificationsEnable)
                        Toggle("Início automático do próximo timer", isOn: $userSettings.autoStartNextEnable)
                        Toggle("Ativar Widget", isOn: $userSettings.clockWidgetEnable)
                    }
                    
                    Section("Limite") {
                        Picker("Tempo total de Trabalho em minutos", selection: $userSettings.workingMinutesTime) {
                            ForEach(userSettings.workingMinutesOptions, id: \.self) { option in
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
                
                
                
                Spacer()
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
