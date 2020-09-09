//
//  RegisterViewController.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 28/08/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!

    var presenter: RegisterViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Datos de usuario"
    }

    @IBAction func cancelButtonDidTap(_ sender: UIButton) {
        presenter?.showLoginController()
    }

    @IBAction func nextButtonDidTap() {
    }
}
