//
//  EmployeeCell.swift
//  InternshipTest
//
//  Created by urichese on 03.11.2022.
//

import UIKit

final class EmployeeCell: UITableViewCell {
	static let reuseId = "EmployeeCell"

	// MARK: - UIViews
	lazy var nameLabel = UILabel()
	lazy var phoneNumberLabel = UILabel()
	var skillsStackView: UIStackView!

	// MARK: - Init
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		backgroundColor = .clear
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Methods

	override func prepareForReuse() {
		self.nameLabel.text = ""
		self.phoneNumberLabel.text = ""
		self.skillsStackView.removeFromSuperview()
	}

	func configureCell(with data: Employee) {

		var subviews: [UILabel] = []

		self.nameLabel.text = data.name
		self.phoneNumberLabel.text = data.phoneNumber

		data.skills.forEach { subviews.append(makeSkillLabel(with: $0)) }

		self.skillsStackView = makeStackView(with: subviews)

		prepareViews()
		setUpSubviews()
		setUpConstraints()
	}

	private func makeSkillLabel(with skill: String) -> UILabel {
		let label = UILabel()
		label.text = skill
		return label
	}

	private func makeStackView(with arrangedSubviews: [UILabel]) -> UIStackView {
		return UIStackView(arrangedSubviews: arrangedSubviews)
	}
}

