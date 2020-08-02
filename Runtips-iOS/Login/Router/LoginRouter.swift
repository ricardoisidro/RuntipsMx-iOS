//
//  LoginRouter.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 5/24/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//

import Foundation
import UIKit

class LoginRouter: PresenterToRouterProtocol {

    static func createLogin() -> UIViewController {
        return loginViewController
    }

    func pushToHomeScreen(navigationController: UINavigationController) {
    }

    static var loginViewController: UIViewController {
        return LoginViewController()
    }
}
