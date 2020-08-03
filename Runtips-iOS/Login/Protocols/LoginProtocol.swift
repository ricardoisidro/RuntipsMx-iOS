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
    func startFetchingCredentials(with user: String, and pass: String)
    func showHomeController(navigationController: UINavigationController, name: String?)
}

protocol PresenterToRouterProtocol: class {
    static func createLogin() -> UIViewController
    func pushToHomeScreen(navigationController: UINavigationController, name: String?)
}

protocol PresenterToInteractorProtocol: class {
    var presenter: InteractorToPresenterProtocol? { get set }
    func fetchLogin(with user: String, and pass: String)
}

protocol InteractorToPresenterProtocol: class {
    func loginFetchedSuccess(with name: String)
    func loginFetchedFailed(error: Error?)
}

protocol PresenterToViewProtocol: class {
    func showHome(name: String)
    func showError()
}
