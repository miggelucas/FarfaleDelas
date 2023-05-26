//
//  FontFormatter.swift
//  FarfaleDelas
//
//  Created by Bof on 26/05/23.
//

import Foundation
import SwiftUI

import Foundation
import SwiftUI

enum AppFont {
    case bimboBig, bimboSmall, louis, hecho, louisSmall, louisVerySmall
}

func getFont(_ font: AppFont) -> UIFont {
    switch font {
    case .bimboBig:
        return UIFont(name: "SF Pro", size: 72)!
    case .bimboSmall:
        return UIFont(name: "Bimbo", size: 32)!
    }
    
    
}
