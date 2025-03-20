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
        return $0
    }(UILabel())
    private let hScrollView: UIScrollView = {
        return $0
    }(UIScrollView())
    private let hStackView: UIStackView = {
        return $0
    }(UIStackView())
//    MARK: Initializations
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - SetupUI
private extension CharactersCell {
    func setupUI() {
        [sectionTitle, hScrollView, hStackView].forEach {contentView.addSubview($0)}
        setupLayout()
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
            hScrollView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            hScrollView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            hScrollView.heightAnchor.constraint(equalToConstant: 200),
            
            hStackView.topAnchor.constraint(equalTo: hScrollView.topAnchor, constant: 10),
            hStackView.leadingAnchor.constraint(equalTo: hScrollView.leadingAnchor),
            hStackView.trailingAnchor.constraint(equalTo: hScrollView.trailingAnchor),
            hStackView.bottomAnchor.constraint(equalTo: hScrollView.bottomAnchor)
        ])
    }
}
