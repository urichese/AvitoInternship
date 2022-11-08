//
//  EmployeesViewController.swift
//  Super easy dev
//
//  Created by urichese on 06.11.2022
//

import UIKit

protocol EmployeesViewProtocol: AnyObject {
    func getEmployees()
}

class EmployeesViewController: UIViewController {
    
    // MARK: - Public
    var presenter: EmployeesPresenterProtocol?
    
    // MARK: - Subviews
    var tableView = UITableView()
    
    // MARK: - Properties
    var company: Company?

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        setupUI()
        getEmployees()
    }
}

// MARK: - Private functions
private extension EmployeesViewController {
    func initialize() {
    }
}
