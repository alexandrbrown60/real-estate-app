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
    private let tableView = SearchResultTableView()
    private let cellId = "Cell"
    
    var properties: [PropertyModel] = [PropertyModel]()
    
    //MARK: - Initializer
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .white
        createProperties()
        tableView.register(ResultTableViewCell.self, forCellReuseIdentifier: cellId)
        setupViews()
    }
    
    //MARK: - Layouts
    private func setupViews() {
        view.addSubview(searchForm)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBlue
        
        NSLayoutConstraint.activate([
            searchForm.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            searchForm.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            searchForm.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            tableView.topAnchor.constraint(equalTo: searchForm.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
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
   
//        let fields = SearchFields(id: 1530, value: "Наша база")
//        let params = SearchParameters(type: 2, fields: [fields])
//        AF.request("https://kluch.me/kluch_metrics/getObjects.php", method: .post, parameters: params).responseDecodable(of: PropertyList.self) { data in
//            print(data)
//        }
    }
    
    @objc func like(_ sender: UIButton) {
        print("Property liked")
    }
    
    func createProperties() {
        properties.append(PropertyModel(propertyId: 1, image: UIImage(named: "real-estate")!, title: "2-ком, 45 м2, 2 эт", description: "Советский р-н", price: "4 500 000 р"))
    }
}
//MARK: - TableView delegate
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as! ResultTableViewCell
        cell.property = properties[indexPath.row]
        return cell
    }
    
    
}
