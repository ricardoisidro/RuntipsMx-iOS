//
//  HomeRouter.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 02/08/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter: PresenterToRouterHomeProtocol {

    static func createHome(usingNavigationFactory navigation: NavigationFactory, name: String?) -> UINavigationController {
        let viewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        viewController.name = name
        return navigation(viewController)
    }
}
