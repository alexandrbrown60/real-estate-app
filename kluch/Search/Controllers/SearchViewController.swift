//
//  SearchViewController.swift
//  kluch
//
//  Created by Александр Иванов on 25.01.2022.
//

import UIKit

class SearchViewController: UIViewController {
    //MARK: - Properties
    private let searchForm = SearchFormView()
    
    //MARK: - Initializer
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSearchForm()
    }
    
    //MARK: - Layouts
    private func setupSearchForm() {
        view.addSubview(searchForm)
        
        NSLayoutConstraint.activate([
            searchForm.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchForm.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchForm.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchForm.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
