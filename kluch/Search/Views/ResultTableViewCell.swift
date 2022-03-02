//
//  ResultTableViewCell.swift
//  kluch
//
//  Created by Александр Иванов on 03.02.2022.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    //MARK: - Properties
    var property: PropertyModel? {
        didSet {
            propertyLabel.text = property?.title
            propertyAddress.text = property?.address
            propertyPrice.text = property?.price
            loadImage(from: property?.imageUrl)
        }
    }
    
    private let propertyImageView: UIImageView = {
       let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private let propertyLabel: PropertyText = PropertyText(font: UIFont.boldSystemFont(ofSize: 16))
    private let propertyAddress: PropertyText = PropertyText()
    private let propertyPrice: PropertyText = PropertyText(lines: 1)
    
    let likeButton: LikeButton = LikeButton(#selector(SearchViewController.like(_:)))
    
    private let textStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    private let mainStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()

    //MARK: - Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(mainStackView)
        setMainStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK: - Layouts
    private func setTextStackView() {
        textStackView.addArrangedSubview(propertyLabel)
        textStackView.addArrangedSubview(propertyPrice)
        textStackView.addArrangedSubview(propertyAddress)
        
    }
    
    private func setMainStackView() {
        setTextStackView()
        mainStackView.addArrangedSubview(propertyImageView)
        mainStackView.addArrangedSubview(textStackView)
        mainStackView.addArrangedSubview(likeButton)
        
        NSLayoutConstraint.activate([
            propertyImageView.widthAnchor.constraint(equalToConstant: 130),
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func loadImage(from url: String?) {
        guard let imageUrl = url else {
            fatalError("No image")
        }
        let url = URL(string: imageUrl)!
        let queue = DispatchQueue.global(qos: .utility)
        
        queue.async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.propertyImageView.image = UIImage(data: data, scale: 1)
                }
            }
        }
    }

}
