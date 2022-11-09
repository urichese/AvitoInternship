//
//  EmployeesViewController + Extensions.swift
//  AvitoInternship
//
//  Created by urichese on 06.11.2022.
//

import UIKit

extension EmployeesViewController: UITableViewDelegate, UITableViewDataSource {

	// MARK: - UITableViewDataSource

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter?.getCountOfEmloyees() ?? 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeCell.reuseId, for: indexPath)

		guard let cell = cell as? EmployeeCell else {
			return cell
		}
		if let employee = presenter?.getEmloyee(row: indexPath.row) {
			cell.configureCell(with: employee)
		}
		return cell
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	// MARK: - UITableViewDelegate

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: EmployeeSectionHeader.reuseIdentifier) as? EmployeeSectionHeader else { return UIView() }
		let c = presenter?.getEmloyeesCompanyName()
		header.setupLabel( c ?? "")
		return header
	}
}
