//
//  LoginProtocol.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 5/24/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class {
    var router: PresenterToRouterProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    var view: PresenterToViewProtocol? { get set }
    var isNavHidden: Bool { get set }
    func viewDidLoad()
    func startFetchingCredentials(with user: String, and pass: String)
    func showHomeController(name: String?)
    func showRegisterController()
}

protocol PresenterToRouterProtocol: class {
    static func createLogin() -> UIViewController
    //push desde el mismo navegador
    func pushToHomeScreen(controller: UIViewController, name: String?)
    //nuevo navegador
    func goToRegisterScreen()
}

protocol PresenterToInteractorProtocol: class {
    var presenter: InteractorToPresenterProtocol? { get set }
    func fetchLogin(with user: String, and pass: String)
    func isNameAuthorized(name: String?) -> Bool
}

protocol InteractorToPresenterProtocol: class {
    func loginFetchedSuccess(with name: String)
    func loginFetchedFailed(error: Error?)
    func nameValidationSuccess(name: String)
    func nameValidationFailed()
}

protocol PresenterToViewProtocol: class {
    func showHome(name: String)
    func showError()
    func showName(name: String)
    func showValidationAlert()
}
