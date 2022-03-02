//
//  LikeButton.swift
//  kluch
//
//  Created by Александр Иванов on 02.03.2022.
//

import UIKit

class LikeButton: UIButton {
 
    init(_ selector: Selector) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setImage(UIImage(systemName: "heart"), for: .normal)
        self.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        self.tintColor = .red
        self.addTarget(self, action: selector, for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
