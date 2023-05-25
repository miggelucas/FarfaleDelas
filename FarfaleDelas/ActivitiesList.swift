//
//  ActivitiesList.swift
//  FarfaleDelas
//
//  Created by ditthales on 25/05/23.
//

import SwiftUI

struct ActivitiesList: View {
    
    @State var activitiesList: [CardView] = [CardView(), CardView(), CardView()]
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("Suas Atividades").foregroundColor(.black)
                Spacer()
                ButtonIcon(buttonType: .add) {
                    
                }
            }
            .padding()
            Spacer()
            if activitiesList.isEmpty{
                Text("Essa tela ta vazia bota uns troço ai na moral :(")
            }else{
                ForEach(activitiesList, id: \.self){ activityView in
                    activityView
                }
            }
            Spacer()
        }.background(.white)
            .frame(width: 415)
    }
}

struct CardView: View, Hashable {
    
    let id = UUID()
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 120, height: 30)
                .foregroundColor(.red)
        }
    }
}

struct ActivitiesList_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesList()
    }
}
