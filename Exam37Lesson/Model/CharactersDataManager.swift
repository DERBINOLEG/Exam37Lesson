//
//  CharactersDataManager.swift
//  Exam37Lesson
//
//  Created by Олег Дербин on 20.03.2025.
//

import UIKit

protocol IDataManager {
    var allCharacters: [CustomViewModel] { get }
    func getEqualCharacter(_ nameCharacter: String) -> CharacterModel?
}

class CharactersDataManager: IDataManager {
    var allCharacters: [CustomViewModel] = []
    init(allCharacters: [CustomViewModel]) {
        self.allCharacters = allCharacters
    }
    func getEqualCharacter(_ nameCharacter: String) -> CharacterModel? {
        for section in allCharacters {
            return section.characterInfo.first { $0.imageName == nameCharacter }
        }
        return nil
    }
}
