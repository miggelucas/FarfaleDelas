

//
//  CardInformation.swift
//  FarfaleDelas
//
//  Created by Bof on 25/05/23.
//
import Foundation
import SwiftUI

struct CardInformation {

    
    // card basico
    let id = UUID()
    var cardType: CardType = .activity

    var duration: String = "30"
    var atividadeText: String = "Nome da atividade"
    var setColor: String = ColorConstant.HIGHLIGHTED_ORANGE
    var description: String = "\nDescrição da atividade"
    var startsOpen: Bool = true

            
    //opcoes de cores
    let colorOptions = [ColorConstant.HIGHLIGHTED_BLUE, ColorConstant.HIGHLIGHTED_RED, ColorConstant.HIGHLIGHTED_ORANGE]
    
    //opcoes de personalizacao
    let timeBoxes = ["20", "30", "45", "60", "90", "120"]
    let pauseBoxes = ["5", "10", "15", "20", "25", "30"]
    
}

enum CardType {
    case pause, activity
}

func getCardType(t: CardType) -> String {
    switch t {
    case .pause:
        return "Pausa"
    case .activity:
        return "Nome da atividade"
    }
}

