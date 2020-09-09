//
//  RegisterProtocol.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 28/08/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//

import UIKit

protocol RegisterViewToPresenterProtocol: AnyObject {
    var router: RegisterPresenterToRouterProtocol? { get set }
    var interactor: RegisterPresenterToInteractorProtocol? { get set }
    func showLoginController()
    func showStepTwoController()
}

protocol RegisterPresenterToRouterProtocol: AnyObject {
    static func createRegister() -> UINavigationController
    func backToLogin()
    func goToStepTwo()
}

protocol RegisterPresenterToInteractorProtocol: AnyObject {
    var presenter: RegisterInteractorToPresenterProtocol? { get set }
    func validateForm()
}

protocol RegisterInteractorToPresenterProtocol: AnyObject { }
