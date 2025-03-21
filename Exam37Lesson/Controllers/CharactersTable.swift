//
//  CharactersTable.swift
//  Exam37Lesson
//
//  Created by Олег Дербин on 20.03.2025.
//

import UIKit

class CharactersTable: UITableViewController {
//    MARK: Properties
    var dataManager: IDataManager!
    private let cellIdentifier = "cellIdentifier"
//    MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CharactersCell.self, forCellReuseIdentifier: cellIdentifier)
        view.backgroundColor = .gray
    }
//    MARK: Methods
    private func presentDetailVC(character: CharacterModel) {
        let presentVC = CharacterInfoVC(characterInfo: character)
        present(presentVC, animated: true)
    }
    // MARK: - Table view data source
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 3
    }
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier,
            for: indexPath
        ) as? CharactersCell else { return UITableViewCell() }
        let model = dataManager.allCharacters[indexPath.row]
        cell.configure(model: model)
        cell.selectionStyle = .none
        cell.action = { text in
            guard let presentCharacter = self.dataManager.getEqualCharacter(text) else {return}
            self.presentDetailVC(character: presentCharacter)
        }
        return cell
    }
}
