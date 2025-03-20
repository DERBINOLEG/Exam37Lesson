//
//  CharacterCustomView.swift
//  Exam37Lesson
//
//  Created by Олег Дербин on 20.03.2025.
//

import UIKit

class CharacterCustomView: UIView {
//    MARK: UIElements
    private let characterImage: UIImageView = {
        return $0
    }(UIImageView())
    private let nameLabel: UILabel = {
        return $0
    }(UILabel())
    private let descriptionLabel: UILabel = {
        return $0
    }(UILabel())
//    MARK: Initializations
    init(characterModel: CharacterModel) {
        super.init(frame: .zero)
        setupUI(model: characterModel)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - SetupUI
private extension CharacterCustomView {
    func setupUI(model: CharacterModel) {
        [characterImage, nameLabel, descriptionLabel].forEach {addSubview($0)}
        setupLayout()
    }
}
//MARK: - Setup Layout
private extension CharacterCustomView {
    func setupLayout() {
        [characterImage, nameLabel, descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 100),
            widthAnchor.constraint(equalToConstant: 200),
            
            characterImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            characterImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            characterImage.heightAnchor.constraint(equalToConstant: 80),
            characterImage.widthAnchor.constraint(equalToConstant: 80),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 10),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
    }
}
