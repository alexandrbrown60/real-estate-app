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
        newsLabel.font = UIFont.boldSystemFont(ofSize: 24)
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
        self.imageName = ""
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        layer.cornerRadius = 5
    }
    
    //MARK: - Layouts
    override func layoutSubviews() {
        super.layoutSubviews()
        setupImageAndTitle()
    }
    
    private func setupImageAndTitle() {
        label.text = title
        imageView.image = UIImage(named: imageName)
        
        addSubview(imageView)
        addSubview(label)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            label.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5)
        ])
    }
}