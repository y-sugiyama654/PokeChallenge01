//
//  ErrorPopView.swift
//  PokeChallenge01
//
//  Created by Sugiyama Yuta on 2022/12/06.
//

import UIKit

// protocolに通知したいメソッドを定義
protocol ErrorPopViewDelegate: AnyObject {
    func retryFetchData()
}

final class ErrorPopView: UIView {
    
    // protocolをプロパティとして宣言
    weak var delegate: ErrorPopViewDelegate?
    
    private lazy var view = UINib(nibName: String(describing: ErrorPopView.self), bundle: nil)
        .instantiate(withOwner: self, options: nil).first as! UIView

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
        // クローズボタン押下時の処理
        view.removeFromSuperview()
    }
    
    @IBAction func retry(_ sender: UIButton) {
        // タップボタン押下時の処理
        print("DEBUG: retryがタップされました")
        delegate?.retryFetchData()
        view.removeFromSuperview()
    }
    
}
