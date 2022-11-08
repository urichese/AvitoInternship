//
//  EmployeesViewController + Actions.swift
//  AvitoInternship
//
//  Created by urichese on 06.11.2022.
//

import Foundation

// MARK: - EmployeesViewProtocol
extension EmployeesViewController: EmployeesViewProtocol {

    func getEmployees() {
        self.company = presenter?.getEmployeesData()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
