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
    var name: String?
    var isNavHidden = true

    init(name: String) {
        self.name = name
    }

    func startFetchingCredentials(with user: String, and pass: String) {
        interactor?.fetchLogin(with: user, and: pass)
    }

    func showHomeController(name: String?) {
        guard let myView = view as? UIViewController else { return }
        router?.pushToHomeScreen(controller: myView, name: name)
    }

    func viewDidLoad() {
        interactor?.isNameAuthorized(name: name)
    }

    func showRegisterController() {
        router?.goToRegisterScreen()
    }
}

extension LoginPresenter: InteractorToPresenterProtocol {
    func nameValidationSuccess(name: String) {
        view?.showName(name: name)
    }

    func loginFetchedSuccess(with name: String) {
        view?.showHome(name: name)
    }

    func loginFetchedFailed(error: Error?) {
        view?.showError()
    }

    func nameValidationFailed() {
        view?.showValidationAlert()
    }
}
