//
//  ActivitiesList.swift
//  FarfaleDelas
//
//  Created by ditthales on 25/05/23.
//

import SwiftUI
import UniformTypeIdentifiers

struct ActivitiesList: View {
    
    @Binding var activitiesList: [CardInformation]
    @State var draggedItem: String?
    let actionButtonAdd: (_ type: CardType)->()
    
    var body: some View {
        VStack(alignment: .center){
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
                        actionButtonAdd(.activity)
                    }
                }.padding()
            }
            Rectangle().foregroundColor(.black).frame(width: 395, height: 1)
            if activitiesList.isEmpty{
                Spacer()
                VStack{
                    Image("imageEmpty")
                    Text("Adicione atividades usando o botão superior. Se lembre de programar pausas esporádicas no seu cronograma.").foregroundColor(.gray).frame(width: 307)
                }
                
            }else{
                HStack {
                    List{
                        ForEach(activitiesList, id: \.id){ activityInfo in
                            HStack(alignment: .top){
                                Spacer()
                                Image("dragIcon")
                                CardView(info: activityInfo){
                                    activitiesList.removeAll{
                                        $0.id == activityInfo.id
                                    }
                                }
                                Spacer()
                            }.foregroundColor(.black)
                        }.onMove(perform: move)
                        HStack {
                            Spacer()
                            PauseButton(){
                                actionButtonAdd(.pause)
                            }
                            Spacer()
                        }
                    }.listStyle(.plain).scrollContentBackground(.hidden)
                }
                
            }
            Spacer()
        }.background(.white)
            .frame(width: 460, height: 596)
    }
    func move(from source: IndexSet, to destination: Int) {
        activitiesList.move(fromOffsets: source, toOffset: destination )
      }
}




struct ActivitiesList_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesList(activitiesList: .constant([CardInformation()])){type in 
            
        }
    }
}
