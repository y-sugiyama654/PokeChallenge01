//
//  PokeListModel.swift
//  PokeChallenge01
//
//  Created by Tanaka Soushi on 2022/11/04.
//

import Foundation

protocol PokeListModelDelegate: AnyObject {
    func fetchPokemonDataSuccess()
    func fetchPokemonDataFailure(error: PokeAPIError?)
}

final class PokeListModel {
    private(set) var pokemons: [Pokemon] = []
    weak var delegate: PokeListModelDelegate?
    let repository = PokeRepository()
    func fetchPokemonData() {
        repository.fetchPokemon { [weak self] result in
            switch result {
            case let .success(pokemons):
                self?.pokemons = pokemons
                self?.delegate?.fetchPokemonDataSuccess()
            case let .failure(error):
                self?.delegate?.fetchPokemonDataFailure(error: error)
            }
        }
    }
}
