//
//  SearchViewController.swift
//  kluch
//
//  Created by Александр Иванов on 25.01.2022.
//

import UIKit
import Alamofire

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
            searchForm.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            searchForm.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            searchForm.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchForm.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    //MARK: - Functions
    @objc func roomDidChange(_ control: UISegmentedControl) {
        switch control.selectedSegmentIndex {
        case 0:
            print(1)
        case 1:
            print(2)
        case 2:
            print(3)
        default:
            print(4)
        }
    }
    
    @objc func search(_ sender: UIButton) {
        let fields = SearchFields(id: 1530, value: "Наша база")
        let params = SearchParameters(type: 2, fields: [fields])
        AF.request("https://kluch.me/kluch_metrics/getObjects.php", method: .post, parameters: params).responseDecodable(of: PropertyList.self) { data in
            print(data)
        }
    }
}

