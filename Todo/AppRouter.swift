//
//  AppRouter.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 14.10.2021.
//

import UIKit

class AppRouter {
    
    func start(scene: UIWindowScene) -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: SplashBuilder.build())
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        window.windowScene = scene
        return window
    }
}
