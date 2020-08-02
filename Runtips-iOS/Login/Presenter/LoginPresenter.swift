//
//  LoginPresenter.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 6/1/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//

import Foundation
import UIKit

class LoginPresenter: ViewToPresenterProtocol {

    var interactor: PresenterToInteractorProtocol?
    var view: PresenterToViewProtocol?
    var router: PresenterToRouterProtocol?

    func startFetchingCredentials(user: String, pass: String) {
        interactor?.fetchLogin()
    }
}
