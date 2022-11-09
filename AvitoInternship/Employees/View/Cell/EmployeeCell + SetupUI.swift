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
        nameLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        phoneNumberLabel.textAlignment = .right
        phoneNumberLabel.textColor = .gray
        phoneNumberLabel.font = .systemFont(ofSize: 12, weight: .medium)
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        skillsStackView.axis = .horizontal
        skillsStackView.distribution = .equalSpacing
        skillsStackView.translatesAutoresizingMaskIntoConstraints = false
        skillsStackView.spacing   = 5
        skillsStackView.isLayoutMarginsRelativeArrangement = true
        
        for view in skillsStackView.subviews {
            var label = view as! UILabel
            label.translatesAutoresizingMaskIntoConstraints = false
            label.heightAnchor.constraint(equalToConstant: 20).isActive = true
            label.textAlignment = NSTextAlignment.center
            label.textColor = UIColor("775495")
            label.layer.backgroundColor = UIColor("ddd2e4").cgColor
            label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            label.widthAnchor.constraint(equalToConstant: (label.text?.size(label.font!).width)! + 10).isActive = true
            label.layer.cornerRadius = 10
            label.layer.masksToBounds = true
        }
    }
    
    func setUpSubviews() {

        // MARK: - add Subviews
        contentView.addSubview(nameLabel)
        contentView.addSubview(skillsStackView)
        contentView.addSubview(phoneNumberLabel)
    }
    
    func setUpConstraints() {
    
        // MARK: - nameLabel constraints
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: phoneNumberLabel.leadingAnchor ,constant: -5),
        ])

        // MARK: - skillsStackView constraints
        NSLayoutConstraint.activate([
//            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            skillsStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            skillsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])

        // MARK: - phoneLabel constraints
        NSLayoutConstraint.activate([
            phoneNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
