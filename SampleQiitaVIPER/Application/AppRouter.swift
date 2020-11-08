//
//  AppRouter.swift
//  SampleQiitaVIPER
//
//  Created by sakiyamaK on 2020/11/01.
//

import UIKit

protocol AppWireframe: AnyObject {
  func showLoginView()
  func showItemView()
}

final class AppRouter {
  private let window: UIWindow

  private init(window: UIWindow) {
    self.window = window
  }

  static func assembleModules(window: UIWindow) -> AppPresentation {
    let router = AppRouter(window: window)
    let interactor = AppInteractor()
    let presenter = AppPresenter(router: router, interactor: interactor)

    return presenter
  }
}


extension AppRouter: AppWireframe {
  func showItemView() {
    let viewController = ItemsRouter.assembleModules()
    let navigationController = UINavigationController(rootViewController: viewController)
    window.rootViewController = navigationController
    window.makeKeyAndVisible()

  }
  func showLoginView() {
    let viewController = LoginRouter.assembleModules()
    window.rootViewController = viewController
    window.makeKeyAndVisible()
  }
}
