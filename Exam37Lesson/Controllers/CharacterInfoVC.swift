//
//  CharacterInfoVC.swift
//  Exam37Lesson
//
//  Created by Олег Дербин on 21.03.2025.
//

import UIKit

class CharacterInfoVC: UIViewController {
//    MARK: UIElements
    private lazy var nameLabel: UILabel = {
        $0.text = self.characterInfo.imageName
        $0.textColor = .yellow
        $0.font = .systemFont(ofSize: 26, weight: .bold)
        return $0
    }(UILabel())
    private lazy var imageCharacter: UIImageView = {
        $0.image = UIImage(named: self.characterInfo.imageName)
        return $0
    }(UIImageView())
    private lazy var descriptionLabel: UILabel = {
        $0.text = self.characterInfo.description
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 25)
        $0.adjustsFontSizeToFitWidth = true
        $0.minimumScaleFactor = 0.7
        return $0
    }(UILabel())
//    MARK: Properties
    private let characterInfo: CharacterModel!
//    MARK: Initializations
//MARK: Life Cycle
    init(characterInfo: CharacterModel!) {
        self.characterInfo = characterInfo
        super.init(nibName: nil, bundle: nil)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupUI()
    }
}
//MARK: - SetupUI
private extension CharacterInfoVC {
    func SetupUI() {
        [nameLabel, imageCharacter, descriptionLabel].forEach {view.addSubview($0)}
        SetupLayout()
        view.backgroundColor = .gray
    }
}
//MARK: - SetupLayout
private extension CharacterInfoVC {
    func SetupLayout() {
        [nameLabel, imageCharacter, descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        let descriptionConstraint = descriptionLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        descriptionConstraint.priority = .defaultHigh
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            imageCharacter.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageCharacter.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            imageCharacter.widthAnchor.constraint(equalTo: view.widthAnchor , multiplier: 0.8),
            imageCharacter.heightAnchor.constraint(equalTo: imageCharacter.widthAnchor),
            
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: imageCharacter.bottomAnchor, constant: 10),
            descriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            descriptionConstraint
        ])
    }
}
