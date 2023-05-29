//
//  HomeView.swift
//  FarfaleDelas
//
//  Created by ditthales on 29/05/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var activitiesViewModel = ActivitiesListViewModel()
    
    var body: some View {
        HStack(spacing: 0){
            ActivitiesList(activitiesList: $activitiesViewModel.cards){ type in
                activitiesViewModel.addCardInformation(type: type)
            }
            Rectangle().frame(width: 173, height: 596).foregroundColor(.black)
        }.preferredColorScheme(.light)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
