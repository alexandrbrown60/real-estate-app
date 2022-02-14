//
//  ResultTableViewCell.swift
//  kluch
//
//  Created by Александр Иванов on 03.02.2022.
//

import UIKit
import Alamofire

class ResultTableViewCell: UITableViewCell {
    //MARK: - Properties
    var property: PropertyModel? {
        didSet {
            propertyLabel.text = property?.title
            propertyDescription.text = property?.description
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
    
    private let propertyLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
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
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        button.tintColor = .red
        button.addTarget(self, action: #selector(SearchViewController.like(_:)), for: .touchUpInside)
        return button
    }()
    
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
        textStackView.addArrangedSubview(propertyDescription)
        
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
        AF.request(imageUrl, method: .get).responseData { data in
            switch data.result {
            case .success(let image):
                self.propertyImageView.image = UIImage(data: image, scale: 1)
            case .failure(let error):
                print(error)
            }
        }
    }

}
