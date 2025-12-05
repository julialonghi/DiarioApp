//
//  TagGenerator.swift
//  Diario
//
//  Created by Julia Oliveira Longhi on 04/12/25.
//

import Foundation
import FoundationModels
import Observation

@Observable
class TagGenerator {
    func gerarTags(para texto: String) async -> [TagModel] {
        let instructions = """
        You are a tag extraction model.
        Your task is to analyze the user's diary text and generate 1-3 short descriptive tags.
        - Tags must be in Portuguese.
        - Tags must be 1–3 words.
        - Tags must summarize key topics, ideas, or emotions.
        - Output must be an array of TagModel.
        """

        let session = LanguageModelSession(model: .default, instructions: instructions)

        do {
            let response = try await session.respond(
                to: "Extract tags from this diary entry: \(texto)",
                generating: [TagModel].self
            )
            return response.content
        } catch {
            print("Erro ao gerar tags: \(error.localizedDescription)")
            return []
        }
    }
}
