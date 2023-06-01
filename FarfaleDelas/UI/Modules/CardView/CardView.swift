//
//  CardView.swift
//  FarfaleDelas
//
//  Created by Bof on 25/05/23.
//

import Foundation
import SwiftUI

struct CardView: View {
    @State var info: CardInformation
    
    @State var isHovered: Bool = false // altera cor do strip
    
    @State var editingTitle: Bool = false // titulo esta sendo editado?
    @State var editingDesc: Bool = false // desc esta sendo editada?
    
    @State var hoveringColor: Bool = false
    @State var editingColor: Bool = false

    @State var eta: Date = .now
    
    let actionForDeleteButton: () -> ()
    
    var body: some View {
        if info.isOngoing {
            ongoingCard
        }
        else {
            finishedCard
        }
    }
    
}
