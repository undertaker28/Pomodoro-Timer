//
//  PomodoroTimerApp.swift
//  Pomodoro Timer
//
//  Created by Pavel on 20.08.22.
//

import SwiftUI

@main
struct PomodoroTimerApp: App {
    @StateObject var pomodoroModel: PomodoroModel = .init()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pomodoroModel)
        }
    }
}
