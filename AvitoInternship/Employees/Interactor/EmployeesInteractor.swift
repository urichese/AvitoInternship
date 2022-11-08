//
//  EmployeesInteractor.swift
//  Super easy dev
//
//  Created by urichese on 06.11.2022
//

protocol EmployeesInteractorProtocol: AnyObject {
    func getEmployeesData() -> Company?
}

class EmployeesInteractor: EmployeesInteractorProtocol {
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    func getEmployeesData() -> Company? {
        var company: Company?
        fetcher.getEmployees { responce in
            company = responce
        }
        return company
    }
    
    weak var presenter: EmployeesPresenterProtocol?
}
