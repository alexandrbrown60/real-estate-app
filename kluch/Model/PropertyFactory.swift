//
//  PropertyFactory.swift
//  kluch
//
//  Created by Александр Иванов on 14.02.2022.
//

import Foundation

enum PropertyTypes {
    case apartment, house, commercial
}

class PropertyFactory {
    static let defaultFactory = PropertyFactory()
    
    func createProperty(ofType type: PropertyTypes, onBase property: Property) -> PropertyModel {
        switch type {
        case .apartment: return Apartments(buildOnBase: property)
        case .house: return Houses(buildOnBase: property)
        case .commercial: return Commercial(buildOnBase: property)
        }
    }
}
