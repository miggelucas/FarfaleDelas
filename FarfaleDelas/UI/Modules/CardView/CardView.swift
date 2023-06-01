//
//  CardView.swift
//  FarfaleDelas
//
//  Created by Bof on 25/05/23.
//

import Foundation
import SwiftUI

struct CardView: View {
    
    var triggerUpdate: (()->())
    
    @State var info: CardInformation
    
    @State var isHovered: Bool = false // altera cor do strip
    
    @State var editingTitle: Bool = false // titulo esta sendo editado?
    @State var editingDesc: Bool = false // desc esta sendo editada?
    
    @State var hoveringColor: Bool = false
    @State var editingColor: Bool = false

    @State var eta: Date = .now {
            didSet {
                self.info.now = eta
            }
        }
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
