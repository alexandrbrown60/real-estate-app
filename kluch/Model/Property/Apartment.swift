//
//  Apartment.swift
//  kluch
//
//  Created by Александр Иванов on 14.02.2022.
//

import Foundation

class Apartments: PropertyModel {
    var propertyId: String
    var imageUrl: String = ""
    var title: String = ""
    var description: String = ""
    var price: String = ""
    
    private var floors: String = ""
    private var titleData: [String] = [String]()
    
    required init(buildOnBase property: Property) {
        self.propertyId = property.id
        
        getFields(property.fields)
        titleData.append(floors)
        self.title = titleData.joined(separator: ", ")
    }
    
    //get field values and set it to properties
    //each field have unique id
    func getFields(_ fields: [PropertyFields]) {
        for field in fields {
            switch field.id {
            case "446":
                let rooms = field.value.get() as! String + " ком"
                titleData.append(rooms)
            case "447":
                let area = field.value.get() as! String + " м²"
                titleData.append(area)
            case "448":
                self.floors = field.value.get() as! String + "/"
            case "467":
                self.floors += field.value.get() as! String + " эт"
            case "470":
                self.price = field.value.get() as! String + " руб."
            case "474":
                let image = field.value.get() as! String
                self.imageUrl = Constans.imageSmallSize + image
            case "630":
                self.description = field.value.get() as! String
            default:
                break
            }
        }
    }
    
   
}
