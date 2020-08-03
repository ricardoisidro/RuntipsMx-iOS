//
//  LoginRouter.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 5/24/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//

import Foundation
import UIKit

// All navigation logic here, describing which screens are to be shown here.

class LoginRouter: PresenterToRouterProtocol {

    static func createLogin() -> UIViewController {
        let viewController = LoginViewController(nibName: "LoginViewController", bundle: nil)

        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = LoginPresenter()
        let interactor: PresenterToInteractorProtocol = LoginInteractor()
        let router: PresenterToRouterProtocol = LoginRouter()

        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return viewController
    }

    func pushToHomeScreen(navigationController: UINavigationController, name: String?) {
        let homeModule = HomeRouter.createHome(name: name)
        navigationController.pushViewController(homeModule, animated: true)
    }
}
