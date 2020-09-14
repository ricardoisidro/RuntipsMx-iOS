//
//  RegisterRouter.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 28/08/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//

import UIKit

class RegisterRouter: RegisterPresenterToRouterProtocol {

    static func createRegister() -> UINavigationController {
        let viewController = RegisterViewController(nibName: "RegisterViewController", bundle: nil)

        let presenter: RegisterViewToPresenterProtocol & RegisterInteractorToPresenterProtocol = RegisterPresenter()
        let router: RegisterPresenterToRouterProtocol = RegisterRouter()
        let interactor: RegisterPresenterToInteractorProtocol = RegisterInteractor()

        viewController.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = viewController
        interactor.presenter = presenter

        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.backgroundColor = UIColor.magenta
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }

    func backToLogin() {
        let loginModule = LoginRouter.createLogin()
        guard let window = UIApplication.shared.keyWindow else { return }
        window.rootViewController = loginModule
    }

    func goToStepTwo() { }

    func goToHomeScreen() {
//        let homeModule = HomeRouter.createHome(name: "Registered!")
//        guard let
    }
}
