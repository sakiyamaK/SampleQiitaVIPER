//
//  AppRouter.swift
//  SampleQiitaVIPER
//
//  Created by sakiyamaK on 2020/11/01.
//

import UIKit

protocol AppWireframe: AnyObject {
  func showStartView()
}

final class AppRouter {
  private let window: UIWindow

  private init(window: UIWindow) {
    self.window = window
  }

  static func assembleModules(window: UIWindow) -> AppPresentation {
    let router = AppRouter(window: window)
    let presenter = AppPresenter(router: router)

    return presenter
  }
}

extension AppRouter: AppWireframe {
  func showStartView() {
    let viewController = LoginRouter.assembleModules()
    let navigationController = UINavigationController(rootViewController: viewController)

    window.rootViewController = navigationController
    window.makeKeyAndVisible()
  }
}
