//
//  EmployeesModuleBuilder.swift
//  Super easy dev
//
//  Created by urichese on 06.11.2022
//

import UIKit

class EmployeesModuleBuilder {
    static func build() -> EmployeesViewController {
        let interactor = EmployeesInteractor()
        let router = EmployeesRouter()
        let presenter = EmployeesPresenter(interactor: interactor, router: router)
        let viewController = EmployeesViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
