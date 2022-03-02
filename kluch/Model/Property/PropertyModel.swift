//
//  Property.swift
//  kluch
//
//  Created by Александр Иванов on 03.02.2022.
//

import UIKit

protocol PropertyModel {
    var propertyId: String {get set}
    var imageUrl: String {get set}
    var title: String {get set}
    var description: String {get set}
    var price: String {get set}
    var address: String {get set}
    
    func getFields(_ fields: [PropertyFields])
    
    init(buildOnBase property: Property)
}


