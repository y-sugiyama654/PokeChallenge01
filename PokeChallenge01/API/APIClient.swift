//
//  APIClient.swift
//  PokeChallenge01
//
//  Created by Tanaka Soushi on 2022/11/09.
//

import Foundation

protocol RequestType {
    var path: String { get }
    associatedtype Response: Decodable
}

struct PokeAPI {
    static var baseURLString: String {
        "https://pokeapi.co/api/v2"
    }
    struct FetchPokemonsRequest: RequestType {
        var limit: Int
        typealias Response = [Pokemon]
        var path: String {
            return "\(PokeAPI.baseURLString)/pokemon&limit=\(limit)"
        }
    }
}

final class APIClient {
    func request<Request: RequestType>(request: Request, _ completion: @escaping (Result<Request.Response, PokeAPIError>) -> Void) {
        
        URLSession.shared.dataTask(with: URL(string: request.path)!, handler: { data, response, error in
            
            if let response = response as? HTTPURLResponse {
                print("response.statusCode = \(response.statusCode)")
            }
            if let error = error {
                completion(.failure(error))
                print("Error: \(error)")
            }

            guard let jsonData = data else { return }
            do {
                let response = try JSONDecoder().decode(Request.Response.self, from: jsonData)
                completion(.success(response))
            } catch {
                completion(.failure(PokeAPIError.decodeError))
                print("decodeError: \(error)")
            }
        })
    }
}
