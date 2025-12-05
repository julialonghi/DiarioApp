//
//  DiaryManager.swift
//  Diario
//
//  Created by Julia Oliveira Longhi on 26/11/25.
//

import Foundation

class DiarioManager: ObservableObject {
    @Published var diarios: [Diario] = []
}
