//
//  TabBarTitle.swift
//  kluch
//
//  Created by Александр Иванов on 25.01.2022.
//

import UIKit

enum TabBar: String {
    case home
    case search
    case favorites
    
    var viewController: UIViewController {
        let viewController: UIViewController
        
        switch self {
        case .home:
            viewController = HomeViewController()
        case .search:
            viewController = SearchTableViewController()
        case .favorites:
            viewController = FavoritesTableViewController()
        }
        viewController.title = title
        return viewController
    }
    
    var title: String {
        switch self {
        case .home:
            return "Главная"
        case .search:
            return "Поиск"
        case .favorites:
            return "Избранное"
        }
    }
    
    var image: UIImage {
        let systemName: String
        switch self {
        case .home:
            systemName = "house.fill"
        case .search:
            systemName = "magnifyingglass"
        case .favorites:
            systemName = "heart.fill"
        }
        guard let image = UIImage(systemName: systemName) else {
            fatalError("Unable to retrieve system image: \(systemName)")
        }
        return image
    }
}
