//
//  EmployeeCell + SetupUI.swift
//  AvitoInternship
//
//  Created by urichese on 07.11.2022.
//

import UIKit

extension EmployeeCell {

	func prepareViews() {

		nameLabel.translatesAutoresizingMaskIntoConstraints = false
		nameLabel.font = Constants.nameLabelFont

		phoneNumberLabel.textAlignment = .right
		phoneNumberLabel.textColor = .gray
		phoneNumberLabel.font = Constants.phoneNumberLabelFont
		phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false

		skillsStackView.axis = .horizontal
		skillsStackView.distribution = .equalSpacing
		skillsStackView.translatesAutoresizingMaskIntoConstraints = false
		skillsStackView.spacing = Constants.skillsStackViewSpace
		skillsStackView.isLayoutMarginsRelativeArrangement = true

		for view in skillsStackView.subviews {
			var label = view as! UILabel
			label.translatesAutoresizingMaskIntoConstraints = false
			label.heightAnchor.constraint(equalToConstant: Constants.skillLabelHeight).isActive = true
			label.textAlignment = NSTextAlignment.center
			label.textColor = UIColor("775495")
			label.layer.backgroundColor = UIColor("ddd2e4").cgColor
			label.font = Constants.skillLabelFont
			if let font = label.font, let text = label.text {
				label.widthAnchor.constraint(equalToConstant: (text.size(font).width + 10)).isActive = true
			}
			label.layer.cornerRadius = Constants.skillLabelcornerRadius
			label.layer.masksToBounds = true
		}
	}

	func setUpSubviews() {
		[nameLabel, skillsStackView, phoneNumberLabel].forEach { contentView.addSubview($0)}
	}

	func setUpConstraints() {

		// MARK: - nameLabel constraints
		NSLayoutConstraint.activate([
			nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.nameLabelInsets.top),
			nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.nameLabelInsets.left),
			nameLabel.trailingAnchor.constraint(equalTo: phoneNumberLabel.leadingAnchor ,constant: Constants.nameLabelInsets.right),
			nameLabel.bottomAnchor.constraint(equalTo: skillsStackView.topAnchor, constant: Constants.nameLabelInsets.bottom),

		// MARK: - skillsStackView constraints
			skillsStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.skillsStackViewInsets.top),
			skillsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.skillsStackViewInsets.left),
			skillsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.skillsStackViewInsets.bottom),

		// MARK: - phoneLabel constraints
			phoneNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.phoneNumberLabelInsets.top),
			phoneNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.phoneNumberLabelInsets.right)
		])
	}
}
