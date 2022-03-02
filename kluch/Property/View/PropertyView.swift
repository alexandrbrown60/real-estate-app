//
//  PropertyView.swift
//  kluch
//
//  Created by Александр Иванов on 01.03.2022.
//

import UIKit

class PropertyView: UIView {

   //MARK: - Properties
    var property: PropertyModel? {
        didSet {
            label.text = property?.title
            price.text = property?.price
            address.text = property?.description
            propertyDescription.text = property?.description
        }
    }
    
    private let imageCarusel: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(ImageCarouselCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    private let label: PropertyText = PropertyText(font: UIFont.boldSystemFont(ofSize: 16))
    private let price: PropertyText = PropertyText(lines: 1)
    private let address: PropertyText = PropertyText()
    private let propertyDescription: PropertyText = PropertyText()
    
    private let likeButton: UIButton = UIButton()
    private let callButton: UIButton = UIButton()
    
    private let mainStackView: UIStackView = UIStackView()
    
    
    //MARK: - Initializations
    init(property: PropertyModel) {
        super.init(frame: .zero)
        self.property = property
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
