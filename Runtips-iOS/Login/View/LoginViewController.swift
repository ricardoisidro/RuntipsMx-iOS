//
//  LoginViewController.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 5/24/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // For network API calls
    var presenter: ViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
}
