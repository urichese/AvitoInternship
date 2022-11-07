//
//  EmployeesInteractor.swift
//  Super easy dev
//
//  Created by urichese on 06.11.2022
//

protocol EmployeesInteractorProtocol: AnyObject {
    func getEmployeesData()
}

class EmployeesInteractor: EmployeesInteractorProtocol {
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    func getEmployeesData() {
        fetcher.getEmployees { [weak self] company in
            if let company = company {
                self?.presenter?.didGetEmployeesData(company: company)
            }
        }
    }
    
    weak var presenter: EmployeesPresenterProtocol?
}
