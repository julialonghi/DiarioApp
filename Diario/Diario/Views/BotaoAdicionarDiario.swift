//
//  BotaoAdicionarDiario.swift
//  Diario
//
//  Created by Julia Oliveira Longhi on 26/11/25.
//

import SwiftUI

struct BotaoAdicionarDiario: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 55)

            Text("Novo Diário")
                .tipografia(.h3)
        }
        .estiloCartaoDiario()
    }
}
