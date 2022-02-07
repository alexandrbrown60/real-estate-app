//
//  NewsBoxView.swift
//  kluch
//
//  Created by Александр Иванов on 25.01.2022.
//

import UIKit

class NewsBoxView: UIView {
    //MARK: - Properties
    let title: String
    let imageName: String
    
    private var label: UILabel = {
        let newsLabel = UILabel()
        newsLabel.numberOfLines = 0
        newsLabel.font = UIFont.boldSystemFont(ofSize: 30)
        newsLabel.textColor = .white
        newsLabel.translatesAutoresizingMaskIntoConstraints = false
        return newsLabel
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    
    //MARK: - Initializers
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.title = "Заголовок"
        self.imageName = "real-estate"
        super.init(coder: aDecoder)
        commonInit()
    }
    
    //MARK: - Layouts
    private func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 50
        layer.masksToBounds = true
        label.text = title
        imageView.image = UIImage(named: imageName)
        
        addSubview(imageView)
        addSubview(label)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            label.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
            heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.1)
        ])
    }
}
