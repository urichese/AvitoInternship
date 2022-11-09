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

    func presentError(errorString: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: errorString, preferredStyle: .alert)
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
    
    @objc func refreshTable(sender: UIRefreshControl) {
        DispatchQueue.main.async {
            self.presenter?.fetchEmployees()
            self.refreshControl.endRefreshing()
        }
    }
}
