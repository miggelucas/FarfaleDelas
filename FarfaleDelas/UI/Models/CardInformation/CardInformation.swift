//
//  CardInformation.swift
//  FarfaleDelas
//
//  Created by ditthales on 26/05/23.
//

import Foundation

struct CardInformation: Identifiable{
    
    let id = UUID()
    
    var atividadeText: String = "Nome da atividade"
    var duration: String = "30"
    var setColor: String = "Green"

    let colors = ["Red", "Green", "Blue", "Black", "Tartan"]
    let timeBoxes = ["20", "30", "45", "60", "90", "120"]
}
