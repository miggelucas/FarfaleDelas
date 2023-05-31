//
//  HomeView.swift
//  FarfaleDelas
//
//  Created by ditthales on 29/05/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var activitiesViewModel = ActivitiesListViewModel()
    
    @State var showingSettingsView: Bool = false
    @State var userSettings: UserSettingsProtocol = dummyUserSettings()
    
    var body: some View {
        HStack(spacing: 0){
            ActivitiesList(activitiesList: $activitiesViewModel.cards){ type in
                activitiesViewModel.addCardInformation(type: type)
            }
            
            ZStack {
                Color(ColorConstant.PRIMARY_BLACK)
                SideView(settingsButtonPressed: {showingSettingsView = true})
                    .padding(20)
            }
            
            
        }.preferredColorScheme(.light)
            .sheet(isPresented: $showingSettingsView) {
                SettingsView(userSettings: $userSettings, backButtonPressed: {showingSettingsView = false})
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
