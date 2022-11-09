//
//  EmployeeSectionHeader.swift
//  AvitoInternship
//
//  Created by urichese on 09.11.2022.
//

import Foundation
import UIKit

class EmployeeSectionHeader: UITableViewHeaderFooterView {

    // MARK: - Properties
    static let reuseIdentifier = "Header"
    
    // MARK: - UIViews
    var headerLabel = UILabel()

    // MARK: - Initialization
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        prepareViews()
        addSubViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func prepareViews() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        headerLabel.textColor = UIColor("252422")
        
        contentView.backgroundColor = UIColor("#f0858b")
    }
    
    private func addSubViews() {
        contentView.addSubview(headerLabel)
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            headerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
