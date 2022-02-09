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
    private var selectedRoom: Int = 0
    
    var properties: [PropertyModel] = [PropertyModel]()
    
    //MARK: - Initializer
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        view.backgroundColor = .white

        tableView.register(ResultTableViewCell.self, forCellReuseIdentifier: cellId)
        setupViews()
    }
    
    //MARK: - Layouts
    private func setupViews() {
        view.addSubview(searchForm)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBlue
        tableView.rowHeight = 100
        
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
            self.selectedRoom = 1
        case 1:
            self.selectedRoom = 2
        case 2:
            self.selectedRoom = 3
        case 3:
            self.selectedRoom = 4
        default:
            self.selectedRoom = 1
        }
        print(selectedRoom)
    }
    
    //make request by triggering Search button
    @objc func search(_ sender: UIButton) {
        self.properties.removeAll()
        
        let source = SearchField(id: 1522, value: "Наша база")
        let rooms = SearchField(id: 446, value: String(self.selectedRoom))
        let params = SearchParameters(type: 1, fields: [source, rooms])
        
        AF.request("https://kluch.me/kluch_metrics/getObjects.php", method: .post, parameters: params).validate().responseDecodable(of: PropertyList.self) { data in
            switch data.result {
            case .success(let value):

                for property in value.list {
                    let propertyModel = PropertyModel(buildOnBase: property)
                    self.properties.append(propertyModel)
                }
                
                self.tableView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //like or dislike property
    @objc func like(_ sender: UIButton) {
        sender.isSelected = true
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
