//
//  EmployeesViewController + Actions.swift
//  AvitoInternship
//
//  Created by urichese on 06.11.2022.
//

import Foundation

// MARK: - EmployeesViewProtocol
extension EmployeesViewController: EmployeesViewProtocol {
    func didGetEmployeesData(company: Company) {
        print(company)
        self.company = company
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    func getEmployees() {
        presenter?.getEmployeesData()
    }
    
}
