//
//  CartaoDiario.swift
//  Diario
//
//  Created by Julia Oliveira Longhi on 26/11/25.
//

import SwiftUI
import Foundation

struct CartaoDiario: View {
    var titulo: String
    var eNovo: Bool

    @State private var shakeValue: CGFloat = 0

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "book.closed.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 55)

            Text(titulo)
                .tipografia(.h3)
        }
        .onAppear {
            if eNovo {
                withAnimation(.linear(duration: 0.6).repeatCount(2, autoreverses: true)) {
                    shakeValue = 1
                }
            }
        }
        .modifier(ShakeEffect(animatableData: shakeValue))
    }
}
