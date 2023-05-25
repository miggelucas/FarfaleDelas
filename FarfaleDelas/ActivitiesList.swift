//
//  ActivitiesList.swift
//  FarfaleDelas
//
//  Created by ditthales on 25/05/23.
//

import SwiftUI

struct ActivitiesList: View {
    
    @State var activitiesList: [CardView] = [CardView(), CardView(), CardView(), CardView(), CardView(), CardView(), CardView(), CardView(), CardView(), CardView()]
    
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
            if activitiesList.isEmpty{
                Spacer()
                Text("Essa tela ta vazia bota uns troço ai na moral :(").foregroundColor(.black)
            }else{
                ForEach(activitiesList, id: \.self){ activityView in
                    activityView
                }
            }
            Spacer()
        }.background(.white)
            .frame(width: 430, height: 596)
    }
}

struct CardView: View, Hashable {
    
    let id = UUID()
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 420, height: 44) //grande é 88
                .foregroundColor(.red)
        }
    }
}

struct ActivitiesList_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesList()
    }
}
