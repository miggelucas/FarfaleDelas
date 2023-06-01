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
    
    func updateTimes(){
        
        if cards.count == 1 { return }
        
        for index in 1..<cards.count {
            cards[index].now = cards[index-1].eta
        }
        print(cards)
        
    }
}
