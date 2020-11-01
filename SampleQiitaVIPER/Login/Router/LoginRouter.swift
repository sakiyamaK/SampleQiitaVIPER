//
//  LoginRouter.swift
//  SampleQiitaVIPER
//
//  Created by sakiyamak on 2020/11/1.
//  Copyright © 2020 sakiyamak. All rights reserved.
//

import UIKit

protocol LoginWireframe: AnyObject {
    
}

final class LoginRouter {
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules() -> UIViewController {
        let view = LoginViewController()
        let router = LoginRouter(viewController: view)
        let presenter = LoginPresenter(
            view: view, 
            router: router
        )
        
        view.presenter = presenter
        
        return view
    }
}

extension LoginRouter: LoginWireframe {
    
}
