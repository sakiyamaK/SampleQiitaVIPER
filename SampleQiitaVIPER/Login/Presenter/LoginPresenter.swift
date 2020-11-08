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
  func tapLoginButton()
}

final class LoginPresenter {
  private weak var view: LoginView?
  private let router: LoginWireframe
  private let interactor: LoginUsecase

  init(
    view: LoginView,
    interactor: LoginUsecase,
    router: LoginWireframe
  ) {
    self.view = view
    self.interactor = interactor
    self.router = router
  }
}

extension LoginPresenter: LoginPresentation {
  func viewDidLoad() {
  }

  func tapLoginButton() {
    router.showWeb(url: interactor.loginURL)
  }
}

