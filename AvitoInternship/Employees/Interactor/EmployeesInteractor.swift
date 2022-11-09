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
        fetcher.getEmployees { [weak self] result in
            self?.presenter?.presentEmployeesFetchedData(responce: result)
        }
    }
    
    weak var presenter: EmployeesPresenterProtocol?
}
