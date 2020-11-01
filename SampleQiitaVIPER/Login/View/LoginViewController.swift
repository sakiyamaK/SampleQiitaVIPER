//
//  LoginViewController.swift
//  SampleQiitaVIPER
//
//  Created by sakiyamak on 2020/11/1.
//  Copyright © 2020 sakiyamak. All rights reserved.
//

import UIKit

protocol LoginView: AnyObject {
    
}

final class LoginViewController: UIViewController {
    var presenter: LoginPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }
}

extension LoginViewController: LoginView {
    
}

