//
//  RegisterEntity.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 11/09/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//

import Foundation

enum Sex: String, CaseIterable {
    case male, female
}

enum State: String, CaseIterable {
    case cdmx = "CDMX", edomex = "México",
    morelos = "Morelos", puebla = "Puebla",
    queretaro = "Querétaro"
}

class RegisterEntity {

    var name: String?
    var surname: String?
    var birthdate: Date?
    var sex: String?
    var state: String?
    var phone: String?
    var mail: String?
    var password: String?

    init(name: String, surname: String,
         birthdate: Date, sex: String? = nil,
         state: String? = nil, phone: String,
         mail: String, password: String? = nil) {
        self.name = name
        self.surname = surname
        self.birthdate = Date()
        self.sex = sex
        self.state = state
        self.phone = phone
        self.mail = mail
        self.password = password
    }
}
