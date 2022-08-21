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
    // MARK: Scene phase
    @Environment(\.scenePhase) var phase
    // MARK: Storing last time stamp
    @State var lastActiveTimeStamp: Date = Date()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pomodoroModel)
        }
        .onChange(of: phase) { newValue in
            if pomodoroModel.isStarted {
                if newValue == .background {
                    lastActiveTimeStamp = Date()
                }
                
                if newValue == .active {
                    // MARK: Finding the difference
                    let currentTimeStampDiff = Date().timeIntervalSince(lastActiveTimeStamp)
                    if pomodoroModel.totalSeconds - Int(currentTimeStampDiff) <= 0 {
                        pomodoroModel.isStarted = false
                        pomodoroModel.totalSeconds = 0
                        pomodoroModel.isFinished = true
                    }
                    else {
                        pomodoroModel.totalSeconds -= Int(currentTimeStampDiff)
                    }
                }
            }
        }
    }
}
