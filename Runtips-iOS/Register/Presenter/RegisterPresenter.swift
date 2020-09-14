//
//  RegisterPresenter.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 30/08/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//
//  swiftlint:disable function_parameter_count

import Foundation

class RegisterPresenter: RegisterViewToPresenterProtocol {

    var interactor: RegisterPresenterToInteractorProtocol?
    var router: RegisterPresenterToRouterProtocol?
    var view: RegisterPresenterToViewProtocol?

    func showLoginController() {
        router?.backToLogin()
    }

    func add(name: String?, surname: String?, birth: String?, sex: String?,
             state: String?, phone: String?, mail: String?, password: String?,
             terms: Bool) {
        interactor?.addUser(name: name, surname: surname, birth: birth, sex: sex,
                            state: state, phone: phone, mail: mail, password: password,
                            terms: terms)
    }

    func showStepTwoController() {
        router?.goToHomeScreen()
    }
}

extension RegisterPresenter: RegisterInteractorToPresenterProtocol {
    func failedRegister(by reason: String) {
        view?.showErrorAlert(message: reason)
    }

    func successfulRegister() {
        view?.showHome()
    }
}
