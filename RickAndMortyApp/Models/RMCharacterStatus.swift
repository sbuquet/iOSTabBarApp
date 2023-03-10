//
//  RMCharacterStatus.swift
//  RickAndMortyApp
//
//  Created by Sebastian Buquet on 29/01/2023.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
