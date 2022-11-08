//
//  EmployeesPresenter.swift
//  Super easy dev
//
//  Created by urichese on 06.11.2022
//

protocol EmployeesPresenterProtocol: AnyObject {
    func getEmployeesData() -> Company?
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
    
    func getEmployeesData() -> Company? {
        return interactor.getEmployeesData()
    }
    
}
