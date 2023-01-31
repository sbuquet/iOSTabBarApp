//
//  RMGetAllCharactersResponse.swift
//  RickAndMortyApp
//
//  Created by Sebastian Buquet on 31/01/2023.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    // MARK: - Info
    struct Info: Codable {
        let count, pages: Int
        let next: String?
        let prev: String?
    }

    let info: Info
    let results: [RMCharacter]
}
