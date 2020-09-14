//
//  RegisterProtocol.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 28/08/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//
//  swiftlint:disable function_parameter_count

import UIKit

protocol RegisterViewToPresenterProtocol: AnyObject {
    var router: RegisterPresenterToRouterProtocol? { get set }
    var interactor: RegisterPresenterToInteractorProtocol? { get set }
    var view: RegisterPresenterToViewProtocol? { get set }
    func showLoginController()
    func add(name: String?, surname: String?, birth: String?, sex: String?,
             state: String?, phone: String?, mail: String?, password: String?,
             terms: Bool)
    func showStepTwoController()
}

protocol RegisterPresenterToRouterProtocol: AnyObject {
    static func createRegister() -> UINavigationController
    func backToLogin()
    func goToHomeScreen()
}

protocol RegisterPresenterToInteractorProtocol: AnyObject {
    var presenter: RegisterInteractorToPresenterProtocol? { get set }
    func addUser(name: String?, surname: String?, birth: String?, sex: String?,
                 state: String?, phone: String?, mail: String?, password: String?,
                 terms: Bool)
}

protocol RegisterInteractorToPresenterProtocol: AnyObject {
    func successfulRegister()
    func failedRegister(by reason: String)
}

protocol RegisterPresenterToViewProtocol: AnyObject {
    func showErrorAlert(message: String)
    func showHome()
}
