//
//  LoginInteractor.swift
//  SampleQiitaVIPER
//
//  Created by sakiyamak on 2020/11/1.
//  Copyright © 2020 sakiyamak. All rights reserved.
//

import Foundation

protocol LoginUsecase {
  var loginURL: URL? { get }
}

final class LoginInteractor {
  let api: APIClient
  init(api: APIClient = API.shared) {
    self.api = api
  }
}

extension LoginInteractor: LoginUsecase {
  var loginURL: URL? { api.oAuthURL }
}
