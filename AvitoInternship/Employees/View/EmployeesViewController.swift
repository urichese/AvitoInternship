//
//  EmployeesViewController.swift
//  Super easy dev
//
//  Created by urichese on 06.11.2022
//

import UIKit

protocol EmployeesViewProtocol: AnyObject {
    func presentCompanyData()
    func presentError(errorString: String)
}

class EmployeesViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: EmployeesPresenterProtocol?
    
    // MARK: - Subviews
    var tableView = UITableView()
    var refreshControl = UIRefreshControl()

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.fetchEmployees()
    }
}
