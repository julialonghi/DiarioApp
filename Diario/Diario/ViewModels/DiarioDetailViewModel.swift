//
//  DiarioDetailViewModel.swift
//  Diario
//
//  Created by Julia Oliveira Longhi on 26/11/25.
//

import SwiftUI

class DiarioDetailViewModel: ObservableObject {
    @Published var entradas: [EntradaDiario] = []
    @Published var textoAtual: String = ""

    var entradasAgrupadas: [(String, [EntradaDiario])] {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "pt_BR")

        let grupos = Dictionary(grouping: entradas) { entrada -> String in
            formatter.string(from: entrada.data)
        }

        return grupos
            .sorted { $0.value.first!.data < $1.value.first!.data }
    }

    func adicionarEntrada() {
        guard !textoAtual.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }

        let nova = EntradaDiario(data: Date(), texto: textoAtual)
        entradas.append(nova)
        textoAtual = ""
    }
}
