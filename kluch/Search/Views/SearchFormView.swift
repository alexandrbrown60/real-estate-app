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
    private let typePicker = UIPickerView()
    private let pickerData = RealEstate.allCases.map { $0.rawValue }
    
    private let singleRoom = RadioButton(title: "1")
    private let twoRooms = RadioButton(title: "2")
    private let threeRooms = RadioButton(title: "3")
    private let fourRooms = RadioButton(title: "4")
    private let roomButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    private let priceFrom = UITextField()
    private let priceTo = UITextField()
    private let priceFieldsStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
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
    private func setupButtonsStackView() {
        roomButtonsStackView.addArrangedSubview(singleRoom)
        roomButtonsStackView.addArrangedSubview(twoRooms)
        roomButtonsStackView.addArrangedSubview(threeRooms)
        roomButtonsStackView.addArrangedSubview(fourRooms)
        
        roomButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupPriceFieldsStackView() {
        priceFieldsStackView.addArrangedSubview(priceFrom)
        priceFieldsStackView.addArrangedSubview(priceTo)
        
        priceFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupMainStackView() {
        setupButtonsStackView()
        setupPriceFieldsStackView()
        
        mainStackView.addArrangedSubview(typePicker)
        mainStackView.addArrangedSubview(roomButtonsStackView)
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
        print(pickerData[row])
    }
    
}
