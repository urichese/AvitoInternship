//
//  EmployeesPresenter.swift
//  AvitoInternship
//
//  Created by urichese on 06.11.2022
//

protocol EmployeesPresenterProtocol: AnyObject {
	func fetchEmployees()
	func getCountOfEmloyees() -> Int?
	func getEmloyee(row: Int) -> Employee?
	func getEmloyeesCompanyName() -> String?
	func presentEmployeesFetchedData(_ responce: Company)
	func presentError(_ error: NetworkError)

}

final class EmployeesPresenter {

	// MARK: - Properties

	weak var view: EmployeesViewProtocol?
	var router: EmployeesRouterProtocol
	var interactor: EmployeesInteractorProtocol

	var company: Company?

	// MARK: - Initialization

	init(interactor: EmployeesInteractorProtocol, router: EmployeesRouterProtocol) {
		self.interactor = interactor
		self.router = router
	}

	// MARK: - Private methods

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

extension EmployeesPresenter: EmployeesPresenterProtocol {
	func presentEmployeesFetchedData(_ responce: Company) {
		self.company = responce
		self.company?.employees.sort {$0.name < $1.name}
		self.view?.presentCompanyData()
	}

	func presentError(_ error: NetworkError) {
		self.view?.presentError(errorString: messageToDisplayFrom(error))
	}


	// MARK: - EmployeesPresenterProtocol methods

	func getEmloyeesCompanyName() -> String? {
		return company?.name
	}

	func fetchEmployees() {
		interactor.getEmployeesData()
	}

	func getEmloyee(row: Int) -> Employee? {
		return company?.employees[row]
	}

	func getCountOfEmloyees() -> Int? {
		return company?.employees.count
	}
}
