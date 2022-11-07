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
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        skillsLabel.textColor = .gray
        skillsLabel.numberOfLines = 0
        skillsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        phoneNumberLabel.textAlignment = .right
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.backgroundColor = UIColor.clear
        containerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpSubviews() {
        contentView.addSubview(containerView)

        containerView.addSubview(nameLabel)
        containerView.addSubview(skillsLabel)
        containerView.addSubview(phoneNumberLabel)
    }
    
    func setUpConstraints() {
        
        // MARK: - containerView constraints
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        // MARK: - nameLabel constraints
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: phoneNumberLabel.leadingAnchor ,constant: -5),
        ])

        // MARK: - skillsLabel constraints
        NSLayoutConstraint.activate([
            skillsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            skillsLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor)
        ])

        // MARK: - phoneLabel constraints
        NSLayoutConstraint.activate([
            phoneNumberLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
}
