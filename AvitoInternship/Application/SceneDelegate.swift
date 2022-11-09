//
//  SceneDelegate.swift
//  AvitoInternship
//
//  Created by urichese on 04.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

		guard let windowScene = (scene as? UIWindowScene) else { return }

		let window = UIWindow(windowScene: windowScene)
		let vc = EmployeesAssembly.build()
		window.rootViewController = vc
		self.window = window
		window.makeKeyAndVisible()
	}
}
