//
//  PokeListModel.swift
//  PokeChallenge01
//
//  Created by Tanaka Soushi on 2022/11/04.
//

import Foundation

protocol PokeListModelDelegate: AnyObject {
    func fetchPokemonDataSuccess()
    func fetchPokemonDataFailure(error: PokeAPIError)
}

final class PokeListModel {
    private(set) var pokemons: [Pokemon] = []
    weak var delegate: PokeListModelDelegate?
    let repository = PokeRepository()
    func fetchPokemonData(limit: Int = 100) {
        repository.fetchPokemon(limit: limit, { [weak self] result in
            switch result {
            case let .success(success):
                self?.pokemons = success.datas
                self?.delegate?.fetchPokemonDataSuccess()
            case let .failure(error):
                self?.delegate?.fetchPokemonDataFailure(error: error as! PokeAPIError)
            }
        })
    }
}
