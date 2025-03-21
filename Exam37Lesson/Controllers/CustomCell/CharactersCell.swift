//
//  CharactersCell.swift
//  Exam37Lesson
//
//  Created by Олег Дербин on 20.03.2025.
//

import UIKit

class CharactersCell: UITableViewCell {
//    MARK: UIElements
    private let sectionTitle: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .yellow
        return $0
    }(UILabel())
    private let hScrollView: UIScrollView = {
        return $0
    }(UIScrollView())
    private let hStackView: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 20
        return $0
    }(UIStackView())
//    MARK: Properties
    var action: ((String) -> ())?
//    MARK: Initializations
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    MARK: Methods
    func configure(model: CustomViewModel) {
        sectionTitle.text = model.sectionTitle
        for character in model.characterInfo {
            let view = CharacterCustomView(characterModel: character)
            view.action = { text in
                self.action?(text)
            }
            hStackView.addArrangedSubview(view)
        }
    }
  
}
//MARK: - SetupUI
private extension CharactersCell {
    func setupUI() {
        [sectionTitle, hScrollView].forEach {contentView.addSubview($0)}
        hScrollView.addSubview(hStackView)
        setupLayout()
        contentView.backgroundColor = .gray
    }
}
//MARK: - Setup Layout
private extension CharactersCell {
    func setupLayout() {
        [sectionTitle, hScrollView, hStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            sectionTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            sectionTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            hScrollView.topAnchor.constraint(equalTo: sectionTitle.bottomAnchor, constant: 10),
            hScrollView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            hScrollView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            hScrollView.heightAnchor.constraint(equalToConstant: 350),
            hScrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            hStackView.topAnchor.constraint(equalTo: hScrollView.topAnchor, constant: 10),
            hStackView.leadingAnchor.constraint(equalTo: hScrollView.leadingAnchor),
            hStackView.trailingAnchor.constraint(equalTo: hScrollView.trailingAnchor),
            hStackView.bottomAnchor.constraint(equalTo: hScrollView.bottomAnchor)
        ])
    }
}
