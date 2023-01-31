//
//  RMCharactersCollectionViewViewModel.swift
//  RickAndMortyApp
//
//  Created by Sebastian Buquet on 31/01/2023.
//

import Foundation

final class RMCharactersCollectionViewViewModel {
public var characterName: String
private var characterStatus: RMCharacterStatus
private var characterImageUrl: URL?

    init(
        characterName: String,
        characterStatus: RMCharacterStatus,
        characterImageUrl: URL?
    ) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }

    public var characterStatusText: String {
        return characterStatus.rawValue
    }

    public func fetchImage() async throws -> Data? {
        let data: Data = try await RMService.shared.fetchImage(url: "https://rickandmortyapi.com/api/character/avatar/14.jpeg")

        return data
    }
}
