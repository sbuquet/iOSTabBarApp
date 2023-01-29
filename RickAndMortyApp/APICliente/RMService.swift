//
//  RMService.swift
//  RickAndMortyApp
//
//  Created by Sebastian Buquet on 29/01/2023.
//

import Foundation

/// Primary API service object
final class RMService {

    ///  Shared singleton
    static let shared = RMService()

    private init() {}


    /// Send a request to the RM API
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: Call back data or error
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {

    }
}
