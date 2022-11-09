//
//  EmployeesViewController + Extensions.swift
//  AvitoInternship
//
//  Created by urichese on 06.11.2022.
//

import Foundation
import UIKit

extension EmployeesViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return company?.employees.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeCell.reuseId, for: indexPath)

        guard let cell = cell as? EmployeeCell else {
            return cell
        }
        if let employee = company?.employees[indexPath.row] {
            cell.name = employee.name
            cell.phoneNumber = employee.phoneNumber
            cell.skills = employee.skills
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return company?.name ?? ""
    }
    // MARK: - UITableViewDelegate
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.reuseId)
//        guard let header = header as? HeaderView else {
//            return header
//        }
//        header.setTitle(displayedModel.company.name)
//        return header
//    }
}
