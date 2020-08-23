//
//  LoginPresenter.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 6/1/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//

import Foundation
import UIKit

// Responsable for get the data from View user actions to Interactor,
// and send data obtained from Interactor to the View. Asks the
// router/wireframe for navigation.

class LoginPresenter: ViewToPresenterProtocol {

    var interactor: PresenterToInteractorProtocol?
    var view: PresenterToViewProtocol?
    var router: PresenterToRouterProtocol?

    func startFetchingCredentials(with user: String, and pass: String) {
        interactor?.fetchLogin(with: user, and: pass)
    }

    // Remove extra navController
    func showHomeController(name: String?) {
        //guard let navVC = UIView.navigationController
        router?.pushToHomeScreen(name: name)
    }
}

extension LoginPresenter: InteractorToPresenterProtocol {
    func loginFetchedSuccess(with name: String) {
        view?.showHome(name: name)
    }

    func loginFetchedFailed(error: Error?) {
        //evaluar error y regresar mensaje de texto a la vista
        view?.showError()
    }
}
