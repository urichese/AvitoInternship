//
//  EmployeesViewController.swift
//  Super easy dev
//
//  Created by urichese on 06.11.2022
//

import UIKit

protocol EmployeesViewProtocol: AnyObject {
    func presentCompanyData(company: Company)
    func presentError(errorString: String)
}

class EmployeesViewController: UIViewController {
    
    // MARK: - Public
    var presenter: EmployeesPresenterProtocol?
    
    // MARK: - Subviews
    var tableView = UITableView()
    var refreshControl = UIRefreshControl()
    
    // MARK: - Properties
    var company: Company?
    var isReloadTable: Bool = false

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        setupUI()
        presenter?.fetchEmployees()
    }
}

// MARK: - Private functions
private extension EmployeesViewController {
    func initialize() {
    }
}
