//
//  RadioButton.swift
//  kluch
//
//  Created by Александр Иванов on 27.01.2022.
//

import UIKit

class RadioButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
