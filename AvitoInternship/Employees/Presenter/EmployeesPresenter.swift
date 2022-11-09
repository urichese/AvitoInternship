//
//  EmployeesPresenter.swift
//  Super easy dev
//
//  Created by urichese on 06.11.2022
//

protocol EmployeesPresenterProtocol: AnyObject {
    func fetchEmployees()
    func presentEmployeesFetchedData(responce: Result<Company, NetworkError>)

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
    func presentEmployeesFetchedData(responce: Result<Company, NetworkError>) {
        switch responce {
            case .success(let company):
                self.view?.presentCompanyData(company: company)
            case .failure(let error):
                self.view?.presentError(errorString: messageToDisplayFrom(error))
        }
    }
    
    
    
    func fetchEmployees() {
        interactor.getEmployeesData()
    }
    private func messageToDisplayFrom(_ error: NetworkError) -> String {
        var message = ""
        switch error {
        case .noInternetConnection, .timeout:
            message = "Check your internet connection"
        default:
            break
        }

        return message
    }
}
