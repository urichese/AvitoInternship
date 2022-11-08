//
//  EmployeesViewController + Actions.swift
//  AvitoInternship
//
//  Created by urichese on 06.11.2022.
//

import Foundation
import UIKit

// MARK: - EmployeesViewProtocol
extension EmployeesViewController: EmployeesViewProtocol {

    func getEmployees() {
        presenter?.fetchEmployeesData()
    }
    func presentError(error: Error) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    func presentCompanyData(company: Company) {
        self.company = company
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
