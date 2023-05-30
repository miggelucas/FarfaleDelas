//
//  ActivitiesListViewModel.swift
//  FarfaleDelas
//
//  Created by ditthales on 29/05/23.
//

import Foundation

final class ActivitiesListViewModel:  ObservableObject {
    
    @Published var cards: [CardInformation] = []
    
    //func addCardInformation(type: CardType){
    func addCardInformation(type: String){
        switch type{
        case "activity":
            cards.append(CardInformation())
        case "pause":
            cards.append(CardInformation(atividadeText: "PAUSA"))
        default:
            cards.append(CardInformation())
        }
    }
}
