//
//  RegisterViewController.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 28/08/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var surnameTextField: UITextField!
    @IBOutlet private weak var birthDateTextField: UITextField!
    @IBOutlet private weak var stateTextField: UITextField!
    @IBOutlet private weak var sexTextField: UITextField!
    @IBOutlet private weak var phoneTextField: UITextField!
    @IBOutlet private weak var mailTextField: UITextField!
    @IBOutlet private weak var termsSwitch: UISwitch!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!

    var presenter: RegisterViewToPresenterProtocol?
    var datePicker = UIDatePicker()
    var statePicker = UIPickerView()
    var sexPicker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Datos de usuario"
        createBirthPicker()
        createStatePicker()
        createSexPicker()
    }

    @IBAction func cancelButtonDidTap(_ sender: UIButton) {
        presenter?.showLoginController()
    }

    @IBAction func nextButtonDidTap() {
        let name = nameTextField.text
        let surname = surnameTextField.text
        let birthDate = birthDateTextField.text
        let sex = sexTextField.text
        let state = stateTextField.text
        let phone = phoneTextField.text
        let mail = mailTextField.text
        let password = passwordTextField.text
        let areTermsAccepted = termsSwitch.isOn
        presenter?.add(name: name, surname: surname, birth: birthDate, sex: sex,
                       state: state, phone: phone, mail: mail, password: password,
                       terms: areTermsAccepted)
    }
}

extension RegisterViewController: RegisterPresenterToViewProtocol {
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    func showHome() {
        presenter?.showStepTwoController()
    }
}

private extension RegisterViewController {
    func createBirthPicker() {
        datePicker.datePickerMode = .date
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Listo", style: .plain, target: self, action: #selector(doneDatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: self,
                                           action: #selector(cancelDatePicker))
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        birthDateTextField.inputView = datePicker
        birthDateTextField.inputAccessoryView = toolbar
    }

    func createStatePicker() {
        statePicker.delegate = self
        statePicker.dataSource = self
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Listo", style: .plain, target: self,
                                         action: #selector(doneStatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: self,
                                           action: #selector(cancelDatePicker))
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        stateTextField.inputView = statePicker
        stateTextField.inputAccessoryView = toolbar
    }

    func createSexPicker() {
        sexPicker.delegate = self
        sexPicker.dataSource = self
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Listo", style: .plain, target: self,
                                         action: #selector(doneSexPicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: self,
                                           action: #selector(cancelDatePicker))
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        sexTextField.inputView = sexPicker
        sexTextField.inputAccessoryView = toolbar
    }

    @objc func doneDatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        birthDateTextField.text = formatter.string(from: datePicker.date)
        view.endEditing(true)
    }

    @objc func doneStatePicker() {
        let index = statePicker.selectedRow(inComponent: 0)
        stateTextField.text = State.allCases[index].rawValue
        view.endEditing(true)
    }

    @objc func doneSexPicker() {
        let index = statePicker.selectedRow(inComponent: 0)
        sexTextField.text = Sex.allCases[index].rawValue
        view.endEditing(true)
    }

    @objc func cancelDatePicker() {
        view.endEditing(true)
    }
}

extension RegisterViewController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case statePicker:
            return State.allCases[row].rawValue
        case sexPicker:
            return Sex.allCases[row].rawValue
        default:
            return "Field"
        }
    }
}

extension RegisterViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case statePicker:
            return State.allCases.count
        case sexPicker:
            return Sex.allCases.count
        default:
            return 1
        }
    }
}
