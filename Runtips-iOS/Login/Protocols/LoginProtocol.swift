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
    func startFetchingCredentials(user: String, pass: String)
}

protocol PresenterToRouterProtocol: class {
    static func createLogin() -> UIViewController
    func pushToHomeScreen(navigationController: UINavigationController)
}

protocol PresenterToInteractorProtocol: class {
    func fetchLogin()
}

protocol InteractorToPresenterProtocol: class {
    func loginFetchedSuccess()
    func loginFetchedFailes()
}

protocol PresenterToViewProtocol: class {
    func showLogin()
    func showError()
}
