//
//  Houses.swift
//  kluch
//
//  Created by Александр Иванов on 14.02.2022.
//

import Foundation

class Houses: PropertyModel {
    var propertyId: String
    var imageUrl: String = ""
    var title: String = ""
    var description: String = ""
    var price: String = ""
    
    private var titleData: [String] = [String]()
    
    required init(buildOnBase property: Property) {
        self.propertyId = property.id
        
        getFields(property.fields)
        self.title = titleData.joined(separator: ", ")
    }
    
    //get field values and set it to properties
    //each field have unique id
    func getFields(_ fields: [PropertyFields]) {
        for field in fields {
            switch field.id {
            case "778":
                let type = field.value.get() as! String
                titleData.append(type)
            case "527":
                let area = field.value.get() as! String + " сот"
                titleData.append(area)
            case "528":
                self.price = field.value.get() as! String + " руб."
            case "558":
                let image = field.value.get() as! String
                self.imageUrl = Constans.imageSmallSize + image
            case "554":
                self.description = field.value.get() as! String
            default:
                break
            }
        }
    }

}
