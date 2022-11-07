//
//  EmployeeCell.swift
//  InternshipTest
//
//  Created by urichese on 03.11.2022.
//

import UIKit

class EmployeeCell: UITableViewCell {
    static let reuseId = "EmployeeCell"
    
    // MARK: - UIViews
    lazy var nameLabel = UILabel()
    lazy var skillsLabel = UILabel()
    lazy var phoneNumberLabel = UILabel()
    
    lazy var containerView = UIView()

    // MARK: - Properties
    
    var name = "" {
        didSet {
            nameLabel.text = name
        }
    }
    
    var phoneNumber = "" {
        didSet {
            phoneNumberLabel.text = phoneNumber
        }
    }
    
    var skills = [String]() {
        didSet {
            var temp = ""
            for i in skills {
                temp += i + ", "
            }
            temp = String(temp.dropLast(2))
            skillsLabel.text = temp
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .clear
        prepareViews()
        setUpSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

