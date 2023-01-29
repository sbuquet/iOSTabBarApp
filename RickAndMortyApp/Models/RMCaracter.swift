//
//  RMCaracter.swift
//  RickAndMortyApp
//
//  Created by Sebastian Buquet on 29/01/2023.
//
import Foundation

// MARK: - Characters
struct RMCharacters: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: RMOrigin
    let location: RMSingleLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
