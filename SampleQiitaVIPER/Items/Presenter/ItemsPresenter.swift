//
//  ItemsPresenter.swift
//  SampleQiitaVIPER
//
//  Created by sakiyamak on 2020/11/8.
//  Copyright © 2020 sakiyamak. All rights reserved.
//

import Foundation

protocol ItemsPresentation: AnyObject {
  func viewDidLoad()
  func selectCell(item: QiitaItemEntity)
}

final class ItemsPresenter {
  private weak var view: ItemsView?
  private let router: ItemsWireframe
  private let interactor: ItemsUsecase

  init(
    view: ItemsView,
    interactor: ItemsUsecase,
    router: ItemsWireframe
  ) {
    self.view = view
    self.interactor = interactor
    self.router = router
  }
}

extension ItemsPresenter: ItemsPresentation {
  func viewDidLoad() {
    interactor.getAuthenticatedUserItems {[weak self] result in
      switch result {
        case .success(let items):
        self?.view?.configure(items: items)
        case .failure(let error):
          self?.view?.show(error: error)
        break
      }
    }
  }

  func selectCell(item: QiitaItemEntity) {
    guard let url = item.url else {
      return
    }
    router.showWeb(url: url)
  }
}

