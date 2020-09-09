//
//  RegisterPresenter.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 30/08/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//

import Foundation

class RegisterPresenter: RegisterViewToPresenterProtocol {

    var interactor: RegisterPresenterToInteractorProtocol?
    var router: RegisterPresenterToRouterProtocol?

    func showLoginController() {
        router?.backToLogin()
    }

    func showStepTwoController() { }
}
