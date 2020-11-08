//
//  ItemsInteractor.swift
//  SampleQiitaVIPER
//
//  Created by sakiyamak on 2020/11/8.
//  Copyright © 2020 sakiyamak. All rights reserved.
//

import Foundation

protocol ItemsUsecase {
  func getAuthenticatedUserItems(completion: ((Result<[QiitaItemEntity], Error>) -> Void)?)
}

final class ItemsInteractor {
  let api: APIClient
  init(api: APIClient = API.shared) {
    self.api = api
  }
}

extension ItemsInteractor: ItemsUsecase {
  func getAuthenticatedUserItems(completion: ((Result<[QiitaItemEntity], Error>) -> Void)? = nil) {
    api.getAuthenticatedUserItems(completion: completion)
  }
}
