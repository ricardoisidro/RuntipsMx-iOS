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

        let presenter: RegisterViewToPresenterProtocol = RegisterPresenter()
        let router: RegisterPresenterToRouterProtocol = RegisterRouter()

        viewController.presenter = presenter
        presenter.router = router
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
}
