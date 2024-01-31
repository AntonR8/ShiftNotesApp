//
//  ShiftNotesAppApp.swift
//  ShiftNotesApp
//
//  Created by АнтохаПрограммист on 31.01.2024.
//

import SwiftUI

@main
struct ShiftNotesAppApp: App {
    @EnvironmentObject var notes: Notes
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Notes())
        }
    }
}
