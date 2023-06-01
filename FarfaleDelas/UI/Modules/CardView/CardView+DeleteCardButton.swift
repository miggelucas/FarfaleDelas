//
//  CardView+DeleteCardButton.swift
//  FarfaleDelas
//
//  Created by Bof on 31/05/23.
//

import Foundation
import SwiftUI

extension CardView {
    var deleteCardButton: some View {
        Button("Delete", action: actionForDeleteButton).foregroundColor(Color.red)
            .buttonStyle(.plain)
            .font(getFont(.cardInfo))
            .disabled(info.isOngoing ? false : true)
    }
}
