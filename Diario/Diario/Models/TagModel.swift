//
//  TagModel.swift
//  Diario
//
//  Created by Julia Oliveira Longhi on 04/12/25.
//

import Foundation
import FoundationModels

@Generable
struct TagModel: Hashable {
    @Guide(description: "A short descriptive tag extracted from the user's diary text.")
    var name: String
}
