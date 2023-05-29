//
//  ActivitiesListViewModel.swift
//  FarfaleDelas
//
//  Created by ditthales on 29/05/23.
//

import Foundation

final class ActivitiesListViewModel:  ObservableObject {
    
    @Published var cards: [CardInformation] = []
    
    
    func addCardInformation(){
        cards.append(CardInformation())
        print("rodou")
    }
}
