//
//  TabBarController.swift
//  SchipholAiport
//
//  Created by Зибейда Алекперли on 14.11.21.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addControllers()
        self.setupUI()
    }
    
    // MARK: - Private
    private func addControllers() {
        var controllers: [UINavigationController] = []
        for item in TabBarItem.allCases {
            controllers.append(createNavController(tabItem: item))
        }
        self.setViewControllers(controllers, animated: true)
    }
    
    private func createNavController(tabItem: TabBarItem) -> UINavigationController {
        let image = UIImage(assetIdentifier: tabItem.icon)!
        let vc = tabItem.controller
        vc.tabBarItem = UITabBarItem(title: tabItem.title, image: image, tag: tabItem.rawValue)
        let navController = UINavigationController(rootViewController: vc)
        return navController
    }

    private func setupUI() {
        tabBar.backgroundImage = UIImage()
        tabBar.unselectedItemTintColor = .grayColor
        tabBar.tintColor = .blueColor
    }
    
}


