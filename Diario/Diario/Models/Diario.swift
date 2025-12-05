//
//  Diario.swift
//  Diario
//
//  Created by Julia Oliveira Longhi on 26/11/25.
//

import Foundation

struct Diario: Identifiable {
    let id = UUID()
    var titulo: String
    var entradas: [EntradaDiario] = []
    var eNovo: Bool = true
    var tags: [TagModel] = []
}
