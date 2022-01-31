//
//  SearchFormView.swift
//  kluch
//
//  Created by Александр Иванов on 27.01.2022.
//

import UIKit

enum RealEstate: String, CaseIterable {
    case newFlat = "Квартира вторичка"
    case oldFlat = "Квартира новостройка"
    case house = "Дом"
    case land = "Участок"
    case commercial = "Коммерческая недвижимость"
}

class SearchFormView: UIView {
    //MARK: - Properties
    
    //real estate type picker
    private let typePicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    private let pickerData = RealEstate.allCases.map { $0.rawValue }
    
    internal let typeLabel: UITextField = {
       let label = UITextField()
        label.text = RealEstate.newFlat.rawValue
        return label
    }()
    
    
    //appartment rooms number choosing
    private let roomsLabel: UILabel = {
       let label = UILabel()
        label.text = "Комнат:"
        return label
    }()
    internal let segmentedRoomControl: UISegmentedControl = {
        let rooms = ["1", "2", "3", "4"]
        let control = UISegmentedControl(items: rooms)
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(SearchViewController.roomDidChange), for: .valueChanged)
        return control
    }()
    private let roomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        return stackView
    }()
    
    //price input
    private let priceLabel: UILabel = {
       let label = UILabel()
        label.text = "Цена:"
        return label
    }()
    internal let priceFrom: UITextField = {
       let textField = UITextField()
        textField.placeholder = "От"
        textField.borderStyle = .roundedRect
        return textField
    }()
    internal let priceTo: UITextField = {
        let textField = UITextField()
         textField.placeholder = "До"
         textField.borderStyle = .roundedRect
         return textField
     }()
    private let priceFieldsStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        return stackView
    }()
    
    //search button
    private let searchButton: UIButton = {
       let button = UIButton()
        button.setTitle("Поиск", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(SearchViewController.search(_:)), for: .touchUpInside)
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
    private func setupRoomsPicker() {
        roomStackView.addArrangedSubview(roomsLabel)
        roomStackView.addArrangedSubview(segmentedRoomControl)
        roomStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupPriceFieldsStackView() {
        priceFieldsStackView.addArrangedSubview(priceLabel)
        priceFieldsStackView.addArrangedSubview(priceFrom)
        priceFieldsStackView.addArrangedSubview(priceTo)
        
        priceFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupMainStackView() {
        setupRoomsPicker()
        setupPriceFieldsStackView()
        typeLabel.inputView = typePicker
        
        mainStackView.addArrangedSubview(typeLabel)
        mainStackView.addArrangedSubview(roomStackView)
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
    
    func hideRoomsIfIsNotFlat() {
        let selectedType = typeLabel.text
        let newFlat = selectedType == RealEstate.newFlat.rawValue
        let oldFlat = selectedType == RealEstate.oldFlat.rawValue
        if newFlat || oldFlat {
            roomStackView.isHidden = false
        } else {
            roomStackView.isHidden = true
        }
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
        hideRoomsIfIsNotFlat()
        typeLabel.resignFirstResponder()
    }
    
}
