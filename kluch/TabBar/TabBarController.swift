//
//  TabBarController.swift
//  kluch
//
//  Created by Александр Иванов on 25.01.2022.
//

import UIKit

final class TabBarController: UITabBarController {
    //MARK: - Properties
    private let homeNavigationController = NavigationController(tabBar: .home)
    private let searchNavigationController = NavigationController(tabBar: .search)
    private let favoritesNavigationController = NavigationController(tabBar: .favorites)
    
    //MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        embedViewControllers()
    }
    
    //MARK: - UI
    private func embedViewControllers() {
        viewControllers = [
            homeNavigationController,
            searchNavigationController,
            favoritesNavigationController
        ]
    }
}

fileprivate final class NavigationController: UINavigationController {
    init(tabBar: TabBar) {
        super.init(rootViewController: tabBar.viewController)
        tabBarItem.title = tabBar.title
        tabBarItem.image = tabBar.image
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
