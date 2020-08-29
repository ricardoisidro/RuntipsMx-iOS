//
//  LoginInteractor.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 02/08/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//

import Foundation

// Only business logic here
// Entity contains models used by Interactor

class LoginInteractor: PresenterToInteractorProtocol {

    let authorizedNames: [String] = ["user", "Ricardo"]
    var presenter: InteractorToPresenterProtocol?

    func fetchLogin(with user: String, and pass: String) {
        if user == "user" && pass == "pass" {
            presenter?.loginFetchedSuccess(with: "Welcome!")
        } else {
            presenter?.loginFetchedFailed(error: nil)
        }
    }

    func isNameAuthorized(name: String?) {
        guard let receivedName = name else { return }
        if authorizedNames.contains(receivedName) {
            presenter?.nameValidationSuccess(name: receivedName)
        } else {
            presenter?.nameValidationFailed()
        }
    }
}
