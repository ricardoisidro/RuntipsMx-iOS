//
//  HomeViewController.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 02/08/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!

    var name: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let theName = name else { return }
        let text = welcomeLabel.text ?? ""
        welcomeLabel.text = theName + ", " + text
    }
}
