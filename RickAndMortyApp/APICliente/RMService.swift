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

    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }

    /// Send a request to the RM API
    /// - Parameters:
    ///   - request: Request instance
    public func execute<T: Codable>(
        _ request: RMRequest
    ) async throws -> T {
        guard let url = request.url else {
            throw RMServiceError.failedToCreateRequest
        }
        let data = try await baseRequest(url)
        return try JSONDecoder().decode(T.self, from: data)
    }

    public func fetchImage(urlString: String) async throws -> Data {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        return try await baseRequest(url)
    }

    private func baseRequest(_ url: URL) async throws -> Data {
        print(url)
        let (data, response) = try await URLSession.shared.data(from: url)
        print(response)
        return data
    }
}
