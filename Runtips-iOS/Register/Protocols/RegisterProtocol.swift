//
//  RegisterProtocol.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 28/08/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//

import UIKit

protocol RegisterPresenterToRouterProtocol: AnyObject {
    static func createRegister() -> UINavigationController
}
