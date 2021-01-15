//
//  AppDelegate.swift
//  YandexWeather
//
//  Created by Давид Михайлов on 15.01.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: ViewController())
        navigationController.navigationBar.barTintColor = .systemYellow
        navigationController.navigationBar.tintColor = .black
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

}

