//
//  EntradaDiario.swift
//  Diario
//
//  Created by Julia Oliveira Longhi on 26/11/25.
//

import Foundation

struct EntradaDiario: Identifiable, Equatable {
    let id = UUID()
    let data: Date
    let texto: String
}
