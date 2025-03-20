//
//  SceneDelegate.swift
//  Exam37Lesson
//
//  Created by Олег Дербин on 19.03.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let VC = CharactersTable()
        VC.dataManager = buildDataManager()
        window?.rootViewController = VC
        window?.makeKeyAndVisible()
    }
}
//MARK: - SetupDataManager
private extension SceneDelegate {
    func buildDataManager() -> IDataManager {
        let repository = Repository()
        let dataManager = CharactersDataManager(allCharacters: repository.getCustomViewModels())
        return dataManager
    }
}

