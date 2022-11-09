//
//  Assembly.swift
//  AvitoInternship
//
//  Created by urichese on 09.11.2022.
//

import Foundation

enum Employees {}

extension Employees {
    
    final class Assembly {
        
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
}
