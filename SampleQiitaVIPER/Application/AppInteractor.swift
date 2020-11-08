//
//  AppInteractor.swift
//  SampleQiitaVIPER
//
//  Created by sakiyamaK on 2020/11/05.
//

import Foundation

protocol AppUsecase {
  var isLogined: Bool { get }
  func postAccessToken(code: String, completion: ((Result<String, Error>) -> Void)?)

}

final class AppInteractor {
  let api: APIClient
  init(api: APIClient = API.shared) {
    self.api = api
  }
}

extension AppInteractor: AppUsecase {
  var isLogined: Bool { UserDefaults.standard.qiitaAccessToken.count > 0 }

  func postAccessToken(code: String, completion: ((Result<String, Error>) -> Void)? = nil) {
    api.postAccessToken(code: code) { result  in
      switch result {
      case .success(let accessTokenEntity):
        UserDefaults.standard.qiitaAccessToken = accessTokenEntity.token
        completion?(.success(accessTokenEntity.token))
      case .failure(let error):
        completion?(.failure(error))
      }
    }
  }
}
