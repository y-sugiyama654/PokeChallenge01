//
//  PokeRepository.swift
//  PokeChallenge01
//
//  Created by Tanaka Soushi on 2022/11/04.
//

import Foundation

final class PokeRepository {
    let apiClient = APIClient()
    func fetchPokemon(_ completion: @escaping (Result<[Pokemon], PokeAPIError>) -> Void) {
        let request = PokeAPI.FetchPokemonsRequest(limit: 800)
        apiClient.request(request: request, completion)
    }
}
