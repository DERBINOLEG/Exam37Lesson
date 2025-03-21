//
//  CharactersDataManager.swift
//  Exam37Lesson
//
//  Created by Олег Дербин on 20.03.2025.
//

import UIKit

protocol IDataManager {
    var allCharacters: [CustomViewModel] { get }
    func getEqualCharacter(_ nameCharacter: Int) -> CharacterModel?
}

class CharactersDataManager: IDataManager {
    var allCharacters: [CustomViewModel] = []
    init(allCharacters: [CustomViewModel]) {
        self.allCharacters = allCharacters
    }
    func getEqualCharacter(_ idCharacter: Int) -> CharacterModel? {
        for section in allCharacters {
            for character in section.characterInfo {
                if character.id == idCharacter {
                    return character
                }
            }
        }
        return nil
    }
}
