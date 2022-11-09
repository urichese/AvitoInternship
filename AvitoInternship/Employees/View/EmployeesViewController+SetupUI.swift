//
//  EmployeesViewController + SetupUI.swift
//  AvitoInternship
//
//  Created by urichese on 06.11.2022.
//

import Foundation
import UIKit

extension EmployeesViewController {

    func setupUI() {
        view.backgroundColor = .systemBackground
        prepareViews()
        addSubViews()
        setUpConstraints()
    }
 
    private func prepareViews() {
        // tableView setup
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: EmployeeCell.reuseId)
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        tableView.refreshControl = refreshControl
        
        refreshControl.addTarget(self, action: #selector(refreshTable), for: .valueChanged)
    }
    private func addSubViews() {
        view.addSubview(tableView)
    }
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

