//
//  HomeView.swift
//  FarfaleDelas
//
//  Created by ditthales on 29/05/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = ActivitiesListViewModel()
    
    var body: some View {
        ActivitiesList(activitiesList: $viewModel.cards){
            viewModel.addCardInformation()
        }.preferredColorScheme(.dark)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
