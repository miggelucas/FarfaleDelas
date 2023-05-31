//
//  Font Extension.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 31/05/23.
//

import Foundation
import SwiftUI

extension Font {
    public enum PrimaryCustomType {
        case h1, h2
    }
    
    public enum SecundaryCustomType {
        case h3, h4, h5, subTitle, textFild, text, button1
    }
    
    static func customPrimary(_ type: PrimaryCustomType) -> Font {
        let weightBold = "Quicksand-Bold"
        let weightSemiBold = "Quicksand-SemiBold"
        
        switch type {
            
        case .h1:
            return .custom(weightBold, size: 26)
        case .h2:
            return .custom(weightSemiBold, size: 14)
        }
    }
    
    static func custumSecondary(_ type: SecundaryCustomType) -> Font {
        let weightBold = "MontserratRoman-Bold"
        let weightSemiBold = "MontserratRoman-SemiBold"
        let weightRegular = "MontserratRoman-Regular"
        let weightMedium = "MontserratRoman-Medium"
        
        switch type {
            
        case .h3:
            return .custom(weightBold, size: 24)
        case .h4:
            return .custom(weightSemiBold, size: 14)
        case .h5:
            return .custom(weightMedium, size: 8)
        case .subTitle:
            return .custom(weightMedium, size: 12)
        case .textFild:
            return .custom(weightMedium, size: 11)
        case .text:
            return .custom(weightRegular, size: 10)
        case .button1:
            return .custom(weightMedium, size: 12)


        }
    }
}
