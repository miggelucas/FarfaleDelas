//
//  WorkingMinuteOptions.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 30/05/23.
//

import Foundation

enum WorkingMinutesOption: String, CaseIterable, Identifiable {
    case min30 = "30 min"
    case min45 = "45 min"
    case min60 = "60 min"
    case min75 = "75 min"
    case min90 = "90 min"
    case min120 = "120 min"
    case min150 = "150 min"
    case min180 = "180 min"
    case min240 = "240 min"
    case min300 = "300 min"
    case min360 = "360 min"
    
    var id: String { self.rawValue }
    
    var value: Double {
        switch self {
        case .min30: return 30
        case .min45: return 45
        case .min60: return 60
        case .min75: return 75
        case .min90: return 90
        case .min120: return 120
        case .min150: return 150
        case .min180: return 180
        case .min240: return 240
        case .min300: return 300
        case .min360: return 360
        }
    }
}
