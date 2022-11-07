//
//  EmployeesPresenter.swift
//  Super easy dev
//
//  Created by urichese on 06.11.2022
//

protocol EmployeesPresenterProtocol: AnyObject {
    func getEmployeesData()
    func didGetEmployeesData(company: Company)
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
    func didGetEmployeesData(company: Company) {
        view?.didGetEmployeesData(company: company)
    }
    
    func getEmployeesData() {
        interactor.getEmployeesData()
    }
    
}
