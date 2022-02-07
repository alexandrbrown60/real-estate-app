//
//  HomeViewContoller.swift
//  kluch
//
//  Created by Александр Иванов on 25.01.2022.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: - Properties
    private let newsPost = NewsBoxView(title: "Квартиры", imageName: "real-estate")
    private let secondPost = NewsBoxView(title: "Дома", imageName: "houses")
    private let thirdPost = NewsBoxView(title: "Участки", imageName: "lands")
    private let fourthPost = NewsBoxView(title: "Коммерция", imageName: "commercial")
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupScrollView()
        setupStackView()
    }
    
    //MARK: - Layouts
    private func setupStackView() {
        stackView.addArrangedSubview(newsPost)
        stackView.addArrangedSubview(secondPost)
        stackView.addArrangedSubview(thirdPost)
        stackView.addArrangedSubview(fourthPost)
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        let contentLayoutGuide = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        let frameLayoutGuide = scrollView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            frameLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            frameLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            frameLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            frameLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
