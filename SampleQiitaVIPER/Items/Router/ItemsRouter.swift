//
//  ItemsRouter.swift
//  SampleQiitaVIPER
//
//  Created by sakiyamak on 2020/11/8.
//  Copyright © 2020 sakiyamak. All rights reserved.
//

import UIKit

protocol ItemsWireframe: AnyObject {
  func showWeb(url: URL)
  func showStart()
}

final class ItemsRouter {
  private unowned let viewController: UIViewController

  private init(viewController: UIViewController) {
    self.viewController = viewController
  }

  static func assembleModules() -> UIViewController {
    let view = ItemsViewController.makeFromStoryboard()
    let interactor = ItemsInteractor()
      let router = ItemsRouter(viewController: view)
    let presenter = ItemsPresenter(
      view: view,
      interactor: interactor,
      router: router
    )

    view.presenter = presenter

    return view
  }
}

extension ItemsRouter: ItemsWireframe {
  func showWeb(url: URL) {
    guard UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
  }

  func showStart() {
    NotificationCenter.default.post(name: .reStart, object: nil)
  }
}
