//
//  SettingsView.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 30/05/23.
//

import SwiftUI

struct SettingsView: View {
    
    @State var touchBarEnable: Bool = false
    @State var notificationsEnable: Bool = true
    @State var autoStartNextEnable: Bool = false
    @State var clockWidgetEnable: Bool = true
    
    @State var workingMinutesTime: String = "30 min"
    
    let workingMinutesOptions: [WorkingMinutesOption] = WorkingMinutesOption.allCases
    
    
    var body: some View {
        
        ZStack {
            Color(ColorConstant.PRIMARY_BLACK)
            
            VStack {
                ZStack {
                    Text("Configurações")
                        .foregroundColor(Color(ColorConstant.PRIMARY_WHITE))
                    
                    HStack {
                        Button {
                            //                        backButtonPressed()
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color(ColorConstant.SECONDARY_PINK))
                        }
                        .buttonStyle(.plain)
                        
                        Spacer()
                        
                    }
                }
                
                Form {
                    Section("Preferências") {
                        Toggle("Ativar touchBar", isOn: $touchBarEnable)
                        Toggle("Notificações", isOn: $notificationsEnable)
                        Toggle("Início automático do próximo timer", isOn: $autoStartNextEnable)
                        Toggle("Ativar Widget", isOn: $clockWidgetEnable)
                    }
                    
                    Section("Limite") {
                        Picker("Tempo total de Trabalho em minutos", selection: $workingMinutesTime) {
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
                
                
                
                Spacer()
            }
            
            
            .frame(width: 632, height: 596)
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
