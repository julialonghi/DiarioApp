//
//  DiarioDetailView.swift
//  Diario
//
//  Created by Julia Oliveira Longhi on 26/11/25.
//

import SwiftUI
import FoundationModels

struct DiarioDetailView: View {
    @State private var tagger = TagGenerator()
    @EnvironmentObject var diarioManager: DiarioManager
    let diario: Diario

    @State private var textoAtual: String = ""

    var body: some View {
        VStack {
            if let diario = diaryOriginal {
                if !diario.tags.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(diario.tags, id: \.self) { tag in
                                Text(tag.name)
                                    .font(.caption)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(Color.blue.opacity(0.15))
                                    .cornerRadius(12)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top, 8)
                }
            }
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {

                    ForEach(grupoDeEntradas, id: \.data) { grupo in
                        VStack(alignment: .leading, spacing: 12) {

                            DataSectionHeader(texto: tituloData(grupo.data))

                            ForEach(grupo.entradas) { entrada in
                                VStack(alignment: .leading, spacing: 4) {

                                    Text(entrada.texto)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                        .padding(.vertical, 2)

                                    Divider()
                                        .background(Color.gray.opacity(0.2))
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }

            HStack {
                TextField("Escreva algo…", text: $textoAtual, axis: .vertical)
                      .padding(6)
                      .overlay(
                          RoundedRectangle(cornerRadius: 14)
                             .stroke(Color.gray, lineWidth: 1)
                        )

                Button("Enviar") {
                    enviarEntrada()
                }
                .disabled(textoAtual.isEmpty)
            }
            .padding()
        }
        .navigationTitle(diario.titulo)
    }

    var grupoDeEntradas: [(data: Date, entradas: [EntradaDiario])] {
        if let original = diaryOriginal {
            let grupos = Dictionary(grouping: original.entradas) { $0.data.apenasDia() }
            return grupos
                .sorted { $0.key > $1.key }
                .map { ($0.key, $0.value) }
        }
        return []
    }

    var diaryOriginal: Diario? {
        diarioManager.diarios.first { $0.id == diario.id }
    }

    func enviarEntrada() {
        guard let index = diarioManager.diarios.firstIndex(where: { $0.id == diario.id }) else { return }

        let novaEntrada = EntradaDiario(data: Date(), texto: textoAtual)

        diarioManager.diarios[index].entradas.append(novaEntrada)

        Task {
            let tagsGeradas = await tagger.gerarTags(para: textoAtual)

            diarioManager.diarios[index].tags.append(contentsOf: tagsGeradas)
        }
        textoAtual = ""
    }

    func tituloData(_ data: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateFormat = "d MMM yyyy"
        return formatter.string(from: data)
    }
}

extension Date {
    func apenasDia() -> Date {
        Calendar.current.startOfDay(for: self)
    }
}

struct DataSectionHeader: View {
    let texto: String

    var body: some View {
        Text(texto)
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.vertical, 4)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

