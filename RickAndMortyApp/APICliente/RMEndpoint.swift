//
//  RMEndpoint.swift
//  RickAndMortyApp
//
//  Created by Sebastian Buquet on 29/01/2023.
//

import Foundation


/// Represent API RMEndpoint
@frozen enum RMEndpoint: String {
    case character
    case episode
    case location
    case image = "character/avatar/14.jpeg"
}
