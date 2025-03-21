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
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return $0
    }(UILabel())
    private let descriptionLabel: UILabel = {
        $0.numberOfLines = 0
        return $0
    }(UILabel())
//    MARK: Properties
    var action: ((Int) -> ())?
    let character: CharacterModel
//    MARK: Initializations
    init(characterModel: CharacterModel) {
        self.character = characterModel
        super.init(frame: .zero)
        setupUI(model: characterModel)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    MARK: Override Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        action?(character.id)
    }
}
//MARK: - SetupUI
private extension CharacterCustomView {
    func setupUI(model: CharacterModel) {
        [characterImage, nameLabel, descriptionLabel].forEach {addSubview($0)}
        setupLayout()
        characterImage.image = UIImage(named: model.imageName)
        nameLabel.text = model.imageName
        descriptionLabel.text = model.description
        backgroundColor = .yellow
        layer.cornerRadius = 20
        layer.shadowColor = UIColor.red.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width: 5, height: 5)
    }
}
//MARK: - Setup Layout
private extension CharacterCustomView {
    func setupLayout() {
        [characterImage, nameLabel, descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 320),
            widthAnchor.constraint(equalToConstant: 700),
            
            characterImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            characterImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            characterImage.heightAnchor.constraint(equalToConstant: 300),
            characterImage.widthAnchor.constraint(equalToConstant: 300),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 10),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
