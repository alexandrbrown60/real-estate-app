//
//  Property.swift
//  kluch
//
//  Created by Александр Иванов on 01.02.2022.
//

import Foundation

enum FieldValueType: Decodable {
    case string(String), location(Location)
    
    init(from decoder: Decoder) throws {
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            
            return
        }
        if let location = try? decoder.singleValueContainer().decode(Location.self) {
            self = .location(location)
            
            return
        }
        
        throw FieldValueTypeError.missingValue
    }
    
    
    enum FieldValueTypeError: Error {
        case missingValue
    }

}


struct PropertyList: Decodable {
    let list: [Property]
}

struct Property: Decodable {
    let id: String
    let date_add: String
    let fields: [PropertyFields]
}

struct PropertyFields: Decodable {
    let id: String
    let value: FieldValueType
    
}

struct Location: Decodable {
    let x: String
    let y: String
}

