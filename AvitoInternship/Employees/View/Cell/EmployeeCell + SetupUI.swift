//
//  EmployeeCell + SetupUI.swift
//  AvitoInternship
//
//  Created by urichese on 07.11.2022.
//

import Foundation
import UIKit

extension EmployeeCell {
    func prepareViews() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        skillsLabel.font = .systemFont(ofSize: 12, weight: .regular)
        skillsLabel.numberOfLines = 0
        skillsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        phoneNumberLabel.textAlignment = .right
        phoneNumberLabel.textColor = .gray
        phoneNumberLabel.font = .systemFont(ofSize: 12, weight: .medium)
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
//        stackView.distribution  = UIStackView.Distribution.equalSpacing
//        stackView.alignment = UIStackView.Alignment.center
//        stackView.spacing   = 16.0
        stackView.backgroundColor = .yellow
    }
    
    func setUpSubviews() {
        contentView.addSubview(containerView)

        containerView.addSubview(nameLabel)
        containerView.addSubview(stackView)
        containerView.addSubview(phoneNumberLabel)
        
        stackView.addSubview(skillsLabel)
    }
    
    func setUpConstraints() {
        
        // MARK: - containerView constraints
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        // MARK: - nameLabel constraints
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: phoneNumberLabel.leadingAnchor ,constant: -5),
        ])

        // MARK: - skillsLabel constraints
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
//            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
//            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])

        // MARK: - phoneLabel constraints
        NSLayoutConstraint.activate([
            phoneNumberLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
}
