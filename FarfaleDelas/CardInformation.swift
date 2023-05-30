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
    
    var atividadeText: String = "Nome da atividade"
    var duration: String = "30"
    var setColor: Color = .pink
    var description: String = "\nDescrição da atividade"
    
    var cardType: CardType = .activity
    
    //opcoes de cores
    let colorOptions = [Color.pink, Color.blue, Color.green, Color.yellow]
    
    //opcoes de personalizacao
    let timeBoxes = ["20", "30", "45", "60", "90", "120"]
    
}

enum CardType {
    case pause, activity
}