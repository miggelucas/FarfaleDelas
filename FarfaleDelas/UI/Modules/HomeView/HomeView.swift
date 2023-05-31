//
//  HomeView.swift
//  FarfaleDelas
//
//  Created by ditthales on 29/05/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeViewModel = HomeViewModel()
    
    @State var showingSettingsView: Bool = false
    @State var userSettings: UserSettingsProtocol = dummyUserSettings()
    
    var body: some View {
        HStack(spacing: 0){
            ActivitiesList(activitiesList: $homeViewModel.cards){ type in
                homeViewModel.addCardInformation(type: type)
            }
            
            ZStack {
                Color(ColorConstant.PRIMARY_BLACK)
                SideView(taskList: $homeViewModel.cards, settingsButtonPressed: {showingSettingsView = true})
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
