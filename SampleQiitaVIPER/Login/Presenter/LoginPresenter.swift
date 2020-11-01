//
//  LoginPresenter.swift
//  SampleQiitaVIPER
//
//  Created by sakiyamak on 2020/11/1.
//  Copyright © 2020 sakiyamak. All rights reserved.
//

import Foundation

protocol LoginPresentation: AnyObject {
    func viewDidLoad()    
}

final class LoginPresenter {
    private weak var view: LoginView?
    private let router: LoginWireframe
    
    init(
        view: LoginView,
        router: LoginWireframe
    ) {
        self.view = view
        self.router = router
    }
}

extension LoginPresenter: LoginPresentation {
    func viewDidLoad() {
        
    }
}

