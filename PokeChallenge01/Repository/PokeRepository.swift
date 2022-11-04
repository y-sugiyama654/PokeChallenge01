//
//  PokeRepository.swift
//  PokeChallenge01
//
//  Created by Tanaka Soushi on 2022/11/04.
//

import Foundation

struct PokeResponse {
    let datas: [Pokemon]
}

final class PokeRepository {
    func fetchPokemon(limit: Int = 30, _ completion: @escaping (Result<PokeResponse, Error>) -> Void) {
        
        let urlString = "https://www.googleapis.com/books/v1/volumes"
        
        guard var urlComponents = URLComponents(string: urlString) else { return }
        urlComponents.queryItems = [
            URLQueryItem(name: "maxResults", value: "\(limit)")
        ]

        URLSession.shared.dataTask(with: urlComponents.url!, handler: { data, response, error in
            
            if let response = response as? HTTPURLResponse {
                print("response.statusCode = \(response.statusCode)")
            }
            if let error = error {
                completion(.failure(error))
                print("Error: \(error)")
            }

            guard let jsonData = data else { return }
            do {
                let pokemons = try JSONDecoder().decode([Pokemon].self, from: jsonData)
                completion(.success(PokeResponse(datas: Array(pokemons[0..<limit]))))
            } catch {
                completion(.failure(error))
                print("decodeError: \(error)")
            }
        })
    }
}
