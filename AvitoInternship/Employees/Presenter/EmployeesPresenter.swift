//
//  EmployeesPresenter.swift
//  Super easy dev
//
//  Created by urichese on 06.11.2022
//

protocol EmployeesPresenterProtocol: AnyObject {
    func fetchEmployeesData()
    func presentFetchedData(responce: Result<Company, Error>)

}

class EmployeesPresenter {
    weak var view: EmployeesViewProtocol?
    var router: EmployeesRouterProtocol
    var interactor: EmployeesInteractorProtocol

    init(interactor: EmployeesInteractorProtocol, router: EmployeesRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension EmployeesPresenter: EmployeesPresenterProtocol {
    func presentFetchedData(responce: Result<Company, Error>) {
        switch responce {
            case .success(let company):
                self.view?.presentCompanyData(company: company)
            case .failure(let error):
                self.view?.presentError(error: error)
        }
    }
    
    
    
    func fetchEmployeesData() {
        interactor.getEmployeesData()
    }
    
}
