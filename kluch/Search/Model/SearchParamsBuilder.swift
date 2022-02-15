//
//  SearchParamsBuilder.swift
//  kluch
//
//  Created by Александр Иванов on 15.02.2022.
//

import Foundation


struct SearchParamsBuilder {
    private let type: String
    private let selectedRoom: Int?
    private var priceRange: String = String()
    
    init(type: String, rooms: Int?, priceFrom: String?, priceTo: String?) {
        self.type = type
        self.selectedRoom = rooms
        
        if let minPrice = priceFrom,
           let maxPrice = priceTo {
            self.priceRange = minPrice + "&" + maxPrice
        }
        
        if priceFrom == nil && priceTo != nil {
            self.priceRange = "<=" + priceTo!
        }
        
        if priceFrom != nil && priceTo == nil {
            self.priceRange = ">=" + priceFrom!
        }
    }
    
    public func build() -> SearchParameters {
        switch type {
        case "Квартира вторичка":
            return SearchParameters(type: 1, fields: forApartments())
        case "Квартира новостройка":
            return SearchParameters(type: 1, fields: forApartments())
        case "Дом":
            return SearchParameters(type: 3, fields: forHouses())
        case "Участок":
            return SearchParameters(type: 3, fields: forHouses())
        case "Коммерция":
            return SearchParameters(type: 2, fields: forCommercial())
        default:
            break
        }
        
        return SearchParameters(type: 1, fields: forApartments())
    }
    
    private func forApartments() -> [SearchField] {
        let type = SearchField(id: 776, value: self.type.lowercased())
        let source = SearchField(id: 1522, value: "Наша база")
        let rooms = SearchField(id: 446, value: String(self.selectedRoom!))
        let price = SearchField(id: 470, value: self.priceRange)
                
        return [type, source, rooms, price]
        
    }
    
    private func forHouses() -> [SearchField] {
        let type = SearchField(id: 778, value: self.type.lowercased())
        let source = SearchField(id: 1538, value: "Наша база")
        let price = SearchField(id: 528, value: self.priceRange)
        
        return [type, source, price]
    }
    
    private func forCommercial() -> [SearchField] {
        let source = SearchField(id: 1530, value: "Наша база")
        let price = SearchField(id: 491, value: self.priceRange)
        
        return [source, price]
    }
    
}
