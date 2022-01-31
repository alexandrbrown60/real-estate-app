//
//  SearchFormView.swift
//  kluch
//
//  Created by Александр Иванов on 27.01.2022.
//

import UIKit

enum RealEstate: String, CaseIterable {
    case newFlat = "квартира вторичка"
    case oldFlat = "квартира новостройка"
    case house = "дом"
    case land = "участок"
    case commercial = "коммерческая недвижимость"
}

class SearchFormView: UIView {
    //MARK: - Properties
    
    //real estate type picker
    private let typePicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    private let pickerData = RealEstate.allCases.map { $0.rawValue }
    
    private let typeLabel: UITextField = {
       let label = UITextField()
        label.text = RealEstate.newFlat.rawValue
        return label
    }()
    
    
    //appartment rooms number choosing
    private let segmentedRoomControl: UISegmentedControl = {
        let rooms = ["1", "2", "3", "4"]
        let control = UISegmentedControl(items: rooms)
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(SearchViewController.roomDidChange), for: .valueChanged)
        return control
    }()
    
    //price input
    private let priceFrom = UITextField()
    private let priceTo = UITextField()
    private let priceFieldsStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    //search button
    private let searchButton: UIButton = {
       let button = UIButton()
        button.setTitle("Поиск", for: .normal)
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        return button
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
         stackView.axis = .vertical
         stackView.distribution = .fill
         stackView.spacing = 15
         return stackView
    }()
    
    //MARK: - Initializer
    init() {
        super.init(frame: .zero)
        typePicker.delegate = self
        typePicker.dataSource = self
        translatesAutoresizingMaskIntoConstraints = false
        setupMainStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layouts

    private func setupPriceFieldsStackView() {
        priceFieldsStackView.addArrangedSubview(priceFrom)
        priceFieldsStackView.addArrangedSubview(priceTo)
        
        priceFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupMainStackView() {
        setupPriceFieldsStackView()
        typeLabel.inputView = typePicker
        segmentedRoomControl.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(typeLabel)
        mainStackView.addArrangedSubview(segmentedRoomControl)
        mainStackView.addArrangedSubview(priceFieldsStackView)
        mainStackView.addArrangedSubview(searchButton)
        
        addSubview(mainStackView)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

//MARK: - PickerView extension
extension SearchFormView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        typeLabel.text = pickerData[row]
        typeLabel.resignFirstResponder()
    }
    
}
