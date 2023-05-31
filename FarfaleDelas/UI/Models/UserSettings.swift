//
//  UserSettings.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 31/05/23.
//

import Foundation


protocol UserSettingsProtocol {
    var touchBarEnable: Bool { get set }
    var notificationsEnable: Bool { get set }
    var autoStartNextEnable: Bool { get set }
    var clockWidgetEnable: Bool { get set }
    
    var workingMinutesTime: WorkingMinutesOption { get set }
    var workingMinutesOptions: [WorkingMinutesOption] { get set }
}


struct dummyUserSettings: UserSettingsProtocol {
    
    var touchBarEnable: Bool = false
    
    var notificationsEnable: Bool = true
    
    var autoStartNextEnable: Bool = true
    
    var clockWidgetEnable: Bool = false
    
    var workingMinutesTime: WorkingMinutesOption = .min300
    
    var workingMinutesOptions: [WorkingMinutesOption] = WorkingMinutesOption.allCases
    
    
}
