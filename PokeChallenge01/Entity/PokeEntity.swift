//
//  PokeEntity.swift
//  PokeChallenge01
//
//  Created by Tanaka Soushi on 2022/11/04.
//

import Foundation

struct Pokemon: Decodable {
    let id: Int
    let name: PokemonNames
    let type: [PokemonType]
    let status: PokemonStatus
    
    private enum CodingKeys: String, CodingKey {
        case id, name, type
        case status = "base"
    }
}

struct PokemonNames: Decodable {
    let english: String
    let japanese: String
    let chinese: String
    let french: String
}

enum PokemonType: String, Decodable {
    case normal = "Normal"
    case fighting = "Fighting"
    case flying = "Flying"
    case poison = "Poison"
    case ground = "Ground"
    case rock = "Rock"
    case bug = "Bug"
    case ghost = "Ghost"
    case steel = "Steel"
    case fire = "Fire"
    case water = "Water"
    case grass = "Grass"
    case electric = "Electric"
    case psychic = "Psychic"
    case ice = "Ice"
    case dragon = "Dragon"
    case dark = "Dark"
    case fairy = "Fairy"
    case unknown = "Unknown"
}

struct PokemonStatus: Decodable {
    let hp: Int
    let attack: Int
    let defense: Int
    let specialAttack: Int
    let specialDefense: Int
    let speed: Int
    
    private enum CodingKeys: String, CodingKey {
        case hp = "HP"
        case attack = "Attack"
        case defense = "Defense"
        case speed = "Speed"
        case specialAttack = "Sp. Attack"
        case specialDefense = "Sp. Defense"
    }
}
