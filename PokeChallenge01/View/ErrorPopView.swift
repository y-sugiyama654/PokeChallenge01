//
//  ErrorPopView.swift
//  PokeChallenge01
//
//  Created by Sugiyama Yuta on 2022/12/06.
//

import UIKit

final class ErrorPopView: UIView {
    
    private lazy var view = UINib(nibName: String(describing: ErrorPopView.self), bundle: nil)
        .instantiate(withOwner: self, options: nil).first as! UIView
    
    private let model = PokeListModel()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func show() {
        view.frame = frame
        view.backgroundColor = .black.withAlphaComponent(0.5)
        addSubview(view)
    }

    @IBAction func close(_ sender: UIButton) {
        view.removeFromSuperview()
    }
    
    @IBAction func retry(_ sender: UIButton) {
        // 「Retry」ボタン押下後にmodel.fetchPokemonData()を呼び出して
        // データの再取得を行いたい。
        model.fetchPokemonData()
    }
    

}
