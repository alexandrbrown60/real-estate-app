//
//  Property.swift
//  kluch
//
//  Created by Александр Иванов on 03.02.2022.
//

import UIKit

struct PropertyModel {
    let propertyId: String
    var image: UIImage = UIImage()
    var imageUrl: String = "https://kluch.intrumnet.com/files/crm/product/resized200x200/"
    var title: String = ""
    var description: String = ""
    var price: String = ""
    
    private var floors: String = ""
    private var titleData: [String] = []
       
    init(buildOnBase property: Property) {
        self.propertyId = property.id
        
        getFields(property.fields)
       
    }
    
    mutating private func getFields(_ fields: [PropertyFields]) {
        for field in fields {
            switch field.id {
            case "446":
                let rooms = field.value.get() as! String + " ком."
                titleData.append(rooms)
            case "447":
                let area = field.value.get() as! String + " м²"
                titleData.append(area)
            case "470":
                self.price = field.value.get() as! String + " руб."
            case "474":
                let image = field.value.get() as! String
                self.imageUrl += image
            case "630":
                self.description = field.value.get() as! String
            default:
                break
            }

        }
    }
    
   
}
