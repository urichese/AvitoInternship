//
//  EmployeesInteractor.swift
//  AvitoInternship
//
//  Created by urichese on 06.11.2022
//

protocol EmployeesInteractorProtocol: AnyObject {
	func getEmployeesData()
}

final class EmployeesInteractor: EmployeesInteractorProtocol {

	// MARK: - Properties

	weak var presenter: EmployeesPresenterProtocol?
	private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())

	// MARK: - EmployeesInteractorProtocol methods

	func getEmployeesData() {
		fetcher.getEmployees { [weak self] result in
			switch result {
				case .success(let company):
					self?.presenter?.presentEmployeesFetchedData(company)
				case .failure(let error):
					self?.presenter?.presentError(error)
			}
		}
	}
}
