//
//  DummyTableViewCell.swift
//  PokeChallenge01
//
//  Created by Tanaka Soushi on 2022/11/03.
//

import UIKit

final class DummyTableViewCell: UITableViewCell {

    @IBOutlet private var titleLabel: UILabel!
    
    func configure(title: String) {
        titleLabel.text = title
    }
}
