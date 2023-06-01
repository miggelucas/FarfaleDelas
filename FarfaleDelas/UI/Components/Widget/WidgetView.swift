//
//  WidgetView.swift
//  FarfaleDelas
//
//  Created by Bof on 31/05/23.
//

import Foundation
import SwiftUI

struct WidgetView: View {
    @ObservedObject var clock: ClockTimer = ClockTimer()
    @ObservedObject var viewModel: SideViewModel = SideViewModel()

    var body: some View {
        
        ClockView(timePassedRatio: viewModel.timeRatio,
                  remainingTime: viewModel.timeRemainingFormatted,
                  strokeColor: viewModel.taskColor
        )
        .background(.clear)
        .frame(width: 105, height: 105)
    }
}
