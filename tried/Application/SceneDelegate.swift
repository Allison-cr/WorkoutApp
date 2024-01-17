//
//  SceneDelegate.swift
//  tried
//
//  Created by Alexander Suprun on 23.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        let tapBarController = TabBarController()
        
        guard let windowScene = (scene as? UIWindowScene) else { return}
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tapBarController
        window?.makeKeyAndVisible()
    }
}

