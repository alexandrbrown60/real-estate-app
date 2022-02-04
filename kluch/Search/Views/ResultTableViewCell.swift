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
            propertyImageView.image = property?.image
            propertyLabel.text = property?.title
            propertyDescription.text = property?.description
            propertyPrice.text = property?.price
        }
    }
    
    private let propertyImageView: UIImageView = {
       let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private let propertyLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private let propertyDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let propertyPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    let likeButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Like", for: .normal)
        button.addTarget(self, action: #selector(SearchViewController.like(_:)), for: .touchUpInside)
        return button
    }()
    
    private let textStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 8
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
        textStackView.addArrangedSubview(propertyDescription)
        
    }
    
    private func setMainStackView() {
        setTextStackView()
        mainStackView.addArrangedSubview(propertyImageView)
        mainStackView.addArrangedSubview(textStackView)
        mainStackView.addArrangedSubview(likeButton)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

}
