//
//  SearchParameters.swift
//  kluch
//
//  Created by Александр Иванов on 02.02.2022.
//

import Foundation

struct SearchParameters: Encodable {
    let type: Int
    let fields: [SearchField]
}

struct SearchField: Encodable {
    let id: Int
    let value: String
}
