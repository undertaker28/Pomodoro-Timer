//
//  ContentView.swift
//  Timer
//
//  Created by Pavel on 20.08.22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var pomodoroModel: TimerModel
    var body: some View {
        Home()
            .environmentObject(pomodoroModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
