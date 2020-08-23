//
//  NavigationBuilder.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 21/08/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//

import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)

class NavigationBuilder {

    static func build(controller: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.navigationBar.barTintColor = .magenta
        navigationController.navigationBar.tintColor = .white
        return navigationController
    }
}
