//
//  ActivitiesListViewModel.swift
//  FarfaleDelas
//
//  Created by ditthales on 29/05/23.
//

import Foundation

final class HomeViewModel:  ObservableObject {
    
    @Published var cards: [CardInformation] = []
    
    func addCardInformation(type: CardType){
        switch type{
        case .activity:
            cards.append(CardInformation(cardType: .activity, atividadeText: "Nome da Atividade"))
        case .pause:
            cards.append(CardInformation(cardType: .pause, atividadeText: "PAUSA", startsOpen: false))
        }
    }
}
