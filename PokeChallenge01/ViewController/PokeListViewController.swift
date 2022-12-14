//
//  PokeListViewController.swift
//  PokeChallenge01
//
//  Created by Tanaka Soushi on 2022/11/03.
//

import UIKit

final class PokeListViewController: UIViewController {
    
    private let model = PokeListModel()

    @IBOutlet private var tableview: UITableView! {
        didSet {
            tableview.delegate = self
            tableview.dataSource = self
            tableview.register(PokeTableViewCell.self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        model.delegate = self
        model.fetchPokemonData()
    }
}

extension PokeListViewController:  ErrorPopViewDelegate {
    func retryFetchData() {
        // retryタップ時にデータの再取得を実行
        model.fetchPokemonData()
    }
}

// MARK: PokelListModelDelegate
extension PokeListViewController:  PokeListModelDelegate {
    func fetchPokemonDataSuccess() {
        tableview.reloadData()
    }
    func fetchPokemonDataFailure(error: PokeAPIError?) {
        // エラー時の処理(エラーポップを表示)
        let errorPopView = ErrorPopView()
        errorPopView.delegate = self
        errorPopView.frame = view.frame
        view.addSubview(errorPopView)
        errorPopView.show()
    }
}

// MARK: UITableViewDelegate
extension PokeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: UITableViewDataSource
extension PokeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(PokeTableViewCell.self, for: indexPath)
        cell.configure(pokemon: model.pokemons[indexPath.row])
        return cell
    }
}
