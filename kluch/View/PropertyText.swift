//
//  PropertyTitle.swift
//  kluch
//
//  Created by Александр Иванов on 02.03.2022.
//

import UIKit

class PropertyText: UILabel {
    
    init(lines: Int = 0, font: UIFont = UIFont.systemFont(ofSize: 15)) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .left
        self.font = font
        self.numberOfLines = lines
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
