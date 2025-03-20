//
//  CharactersDataManager.swift
//  Exam37Lesson
//
//  Created by Олег Дербин on 20.03.2025.
//

import UIKit

protocol IDataManager {
    var allCharacters: [CustomViewModel] { get }
}

class CharactersDataManager: IDataManager {
    var allCharacters: [CustomViewModel] = []
    
    init(allCharacters: [CustomViewModel]) {
        self.allCharacters = allCharacters
    }
}
