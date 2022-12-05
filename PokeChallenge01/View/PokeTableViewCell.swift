//
//  PokeTableViewCell.swift
//  PokeChallenge01
//
//  Created by Sugiyama Yuta on 2022/11/28.
//

import UIKit

final class PokeTableViewCell: UITableViewCell {
    
    
    @IBOutlet private var numberLabel: UILabel!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var hpLabel: UILabel!
    @IBOutlet private var attackLabel: UILabel!
    @IBOutlet private var defenseLabel: UILabel!
    @IBOutlet private var specialDefenseLabel: UILabel!
    @IBOutlet private var speedLabel: UILabel!
    
    @IBOutlet private var pokeView: UIImageView!
    
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
    }
    
}
