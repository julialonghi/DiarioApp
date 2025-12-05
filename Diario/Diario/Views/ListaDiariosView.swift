//
//  ListaDiariosView.swift
//  Diario
//
//  Created by Julia Oliveira Longhi on 26/11/25.
//

import SwiftUI

struct ListaDiariosView: View {
    @EnvironmentObject var diarioManager: DiarioManager
    @State private var exibindoPopupNovoDiario = false
    @State private var nomeNovoDiario = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [.init(.adaptive(minimum: 130), spacing: 30)], spacing: 30) {

                    Button {
                        exibindoPopupNovoDiario = true
                    } label: {
                        BotaoAdicionarDiario()
                    }

                    ForEach(diarioManager.diarios) { diario in
                        NavigationLink {
                            DiarioDetailView(diario: diario)
                                .environmentObject(diarioManager)
                        } label: {
                            CartaoDiario(titulo: diario.titulo, eNovo: diario.eNovo)
                        }
                        .estiloCartaoDiario()
                    }
                }
                .padding()
            }
            .navigationTitle("Meus Diários")
        }
        .alert("Título do diário", isPresented: $exibindoPopupNovoDiario) {
            TextField("Nome do diário", text: $nomeNovoDiario)

            Button("Criar") {
                let novo = Diario(titulo: nomeNovoDiario, eNovo: true)
                diarioManager.diarios.append(novo)
                nomeNovoDiario = ""
            }

            Button("Cancelar", role: .cancel) {
                nomeNovoDiario = ""
            }
        }
    }
}

extension Color {
    static let fundoDiario = Color(.systemGray6)
    static let sombraDiario = Color(.systemGray3)
}

extension View {
    func estiloCartaoDiario() -> some View {
        self
            .padding()
            .frame(maxWidth: .infinity, minHeight: 150)
            .background(Color.fundoDiario)
            .cornerRadius(16)
            .shadow(color: .sombraDiario.opacity(0.4), radius: 4, x: 0, y: 2)
    }
}

enum EstiloTipografia {
    case h1, h2, h3, corpo
}

extension View {
    func tipografia(_ estilo: EstiloTipografia) -> some View {
        switch estilo {
        case .h1:
            return self.font(.system(size: 32, weight: .bold))
        case .h2:
            return self.font(.system(size: 24, weight: .semibold))
        case .h3:
            return self.font(.system(size: 18, weight: .medium))
        case .corpo:
            return self.font(.system(size: 16))
        }
    }
}

#Preview {
    ListaDiariosView()
}
