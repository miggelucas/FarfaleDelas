//
//  ActivitiesList.swift
//  FarfaleDelas
//
//  Created by ditthales on 25/05/23.
//

import SwiftUI

struct ActivitiesList: View {
    
    @State var activitiesList: [CardView] = [CardView(info: CardInformation()), CardView(info: CardInformation())]
    
    var body: some View {
        VStack{
            ZStack {
                HStack{
                    Spacer()
                    Text("Suas Atividades").foregroundColor(.black)
                    Spacer()
                }
                .padding()
                HStack{
                    Spacer()
                    ButtonIcon(buttonType: .add) {
                        activitiesList.append(CardView(info: CardInformation()))
                    }
                }.padding()
            }
            if activitiesList.isEmpty{
                Spacer()
                Text("Essa tela ta vazia bota uns troço ai na moral :(").foregroundColor(.black)
            }else{
                ForEach(activitiesList, id: \.id){ activityView in
                    activityView
                }
            }
            Spacer()
        }.background(.black)
            .frame(width: 430, height: 596)
    }
}


struct ActivitiesList_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesList()
    }
}
