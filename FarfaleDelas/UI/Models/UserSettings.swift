//
//  UserSettings.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 31/05/23.
//

import Foundation


protocol UserSettingsProtocol {
    var isTouchBarEnable: Bool { get set }
    var isNotificationsEnable: Bool { get set }
    var isAutoStartNextEnable: Bool { get set }
    var isClockWidgetEnable: Bool { get set }
    
    var workingMinutesTime: Double { get set }
    
    
}


struct dummyUserSettings: UserSettingsProtocol {
    
    var isTouchBarEnable: Bool = false
    
    var isNotificationsEnable: Bool = true
    
    var isAutoStartNextEnable: Bool = true
    
    var isClockWidgetEnable: Bool = false
    
    var workingMinutesTime: Double = WorkingMinutesOption.min240.value

    
    
}
