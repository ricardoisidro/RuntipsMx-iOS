//
//  LoginViewController.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 5/24/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet private weak var userTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginMessage: UILabel!

    // For network API calls
    var presenter: ViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        hideMessage()
        userTextField.delegate = self
        passwordTextField.delegate = self
        view.addGestureRecognizer(tap)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = (presenter?.isNavHidden ?? false)
    }

    //Es preferible que el presenter del Home determine si se mostrará el nav
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let user = userTextField.text,
            let pwds = passwordTextField.text else { return }
        presenter?.startFetchingCredentials(with: user, and: pwds)
    }
}

private extension LoginViewController {

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    func hideMessage() {
        UIView.animate(withDuration: 0.8) { [weak self] in
            self?.loginMessage.alpha = 0
        }
    }
}

extension LoginViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        hideMessage()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
}

extension LoginViewController: PresenterToViewProtocol {
    func showValidationAlert() {
        let alert = UIAlertController(title: "Restricción", message: "Usuario no autorizado", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    func showHome(name: String) {
        presenter?.showHomeController(name: name)
    }

    func showError() {
        passwordTextField.text = nil
        userTextField.text = nil
        UIView.animate(withDuration: 0.6, animations: { [weak self] in
            self?.loginMessage.text = "Usuario o contraseña incorrecto"
            self?.loginMessage.alpha = 1.0
        })
    }

    func showName(name: String) {
        print("Llegó \(name)")
    }
}
