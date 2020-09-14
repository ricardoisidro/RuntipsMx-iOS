//
//  RegisterInteractor.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 11/09/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//
//  swiftlint:disable function_parameter_count

import Foundation

class RegisterInteractor: RegisterPresenterToInteractorProtocol {

    var presenter: RegisterInteractorToPresenterProtocol?
    var user: RegisterEntity?

    func addUser(name: String?, surname: String?, birth: String?, sex: String?,
                 state: String?, phone: String?, mail: String?, password: String?,
                 terms: Bool) {
        guard let name = name, validateName(name) else {
            presenter?.failedRegister(by: "Ingresar nombre")
            return
        }
        guard let surname = surname, validateSurname(surname) else {
            presenter?.failedRegister(by: "Ingresar apellidos")
            return
        }
        guard let birthString = birth, let date = toDate(birthString) else {
            presenter?.failedRegister(by: "Ingresar fecha de nacimiento")
            return
        }
        guard let phone = phone, phone.count > 0 else {
            presenter?.failedRegister(by: "Ingresar número celular")
            return
        }
        guard let mail = mail, mail.count > 0, mail.isValidMail else {
            presenter?.failedRegister(by: "Ingresar correo electrónico")
            return
        }
        guard let password = password, password.count > 0 else {
            presenter?.failedRegister(by: "Ingresar contraseña")
            return
        }
        if terms {
            user = RegisterEntity(name: name, surname: surname, birthdate: date, sex: sex, state: state,
                                  phone: phone, mail: mail, password: password)
            presenter?.successfulRegister()
        } else {
            presenter?.failedRegister(by: "Aceptar términos y condiciones")
        }
    }
}

private extension RegisterInteractor {

    func validateSurname(_ surname: String) -> Bool {
        return surname.count > 0
    }

    func validateName(_ name: String) -> Bool {
        return name.count > 0
    }

    func toDate(_ theDate: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.date(from: theDate)
    }
}
