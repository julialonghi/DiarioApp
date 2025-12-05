//
//  DiarioApp.swift
//  Diario
//
//  Created by Julia Oliveira Longhi on 02/12/25.
//

import SwiftUI

@main
struct DiarioApp: App {
    @StateObject var diarioManager = DiarioManager()
    
    var body: some Scene {
        WindowGroup {
            ListaDiariosView()
                .environmentObject(diarioManager)
        }
    }
}
