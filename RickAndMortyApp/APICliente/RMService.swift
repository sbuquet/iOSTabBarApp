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
        let data = try await baseRequest(request)
        return try JSONDecoder().decode(T.self, from: data)
    }

    public func fetchImage(_ request: RMRequest) async throws -> Data {
        return try await baseRequest(request)
    }

    private func baseRequest(_ request: RMRequest) async throws -> Data {
        guard let url = request.url else {
            throw RMServiceError.failedToCreateRequest
        }
        print(url)
        let (data, response) = try await URLSession.shared.data(from: url)
        print(response)
        return data
    }
}
