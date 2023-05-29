//
//  ActivitiesList.swift
//  FarfaleDelas
//
//  Created by ditthales on 25/05/23.
//

import SwiftUI
import UniformTypeIdentifiers

struct ActivitiesList: View {
    
    @State var activitiesList: [CardInformation] = []
    @State var draggedItem: String?
    
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
                        activitiesList.append(CardInformation())
                    }
                }.padding()
            }
            if activitiesList.isEmpty{
                Spacer()
                VStack{
                    Image("imageEmpty")
                    Text("Adicione atividades usando o botão superior. Se lembre de programar pausas esporádicas no seu cronograma.").foregroundColor(.gray).frame(width: 307)
                }
                
            }else{
                LazyVStack{
                    ForEach(activitiesList, id: \.id){ activityInfo in
                        HStack{
                            Text("::")
                            CardView(info: activityInfo){
                                activitiesList.removeAll{
                                    $0.id == activityInfo.id
                                }
                            }
                        }.foregroundColor(.black)
                    }.onMove(perform: move)
                }
                
            }
            Spacer()
        }.background(.white)
            .frame(width: 430, height: 596)
    }
    func move(from source: IndexSet, to destination: Int) {
        activitiesList.move(fromOffsets: source, toOffset: destination )
      }
}




struct ActivitiesList_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesList()
    }
}
