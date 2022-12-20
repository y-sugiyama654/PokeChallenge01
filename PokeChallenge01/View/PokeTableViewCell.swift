//
//  PokeTableViewCell.swift
//  PokeChallenge01
//
//  Created by Sugiyama Yuta on 2022/11/28.
//

import UIKit

final class PokeTableViewCell: UITableViewCell {
    
    private let imageUrl: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
    
    @IBOutlet private var numberLabel: UILabel!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var hpLabel: UILabel!
    @IBOutlet private var attackLabel: UILabel!
    @IBOutlet private var defenseLabel: UILabel!
    @IBOutlet private var specialDefenseLabel: UILabel!
    @IBOutlet private var speedLabel: UILabel!
    @IBOutlet private var pokemonImage: UIImageView!
    @IBOutlet private var specialAttackLabel: UILabel!
    
    func configure(pokemon: Pokemon) {
        numberLabel.text = "No: \(pokemon.id)"
        titleLabel.text = pokemon.name.japanese
        hpLabel.text = "HP \(pokemon.status.hp)"
        attackLabel.text = "こうげき \(pokemon.status.attack)"
        defenseLabel.text = "ぼうぎょ \(pokemon.status.defense)"
        specialAttackLabel.text = "とくこう \(pokemon.status.specialAttack)"
        specialDefenseLabel.text = "とくぼう \(pokemon.status.specialDefense)"
        speedLabel.text = "すばやさ \(pokemon.status.speed)"
        setImage(id: pokemon.id)
    }
    
    private func setImage(id: Int) {
        let request = URLRequest(url: URL(string: imageUrl + "\(id).png")!)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async { [weak self] in
                self?.pokemonImage.image = UIImage(data: data)
            }
        }
        .resume()
    }
    
}
