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
            tableview.register(DummyTableViewCell.self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
        model.dummyData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(DummyTableViewCell.self, for: indexPath)
        cell.configure(title: model.dummyData()[indexPath.row])
        return cell
    }
}
