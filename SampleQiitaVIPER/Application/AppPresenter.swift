//
//  AppPresenter.swift
//  SampleQiitaVIPER
//
//  Created by sakiyamaK on 2020/11/01.
//

import Foundation

protocol AppPresentation: AnyObject {
  func didFinishLaunch()
}

final class AppPresenter {
  private let router: AppWireframe

  init(router: AppWireframe) {
    self.router = router
  }
}

extension AppPresenter: AppPresentation {
  func didFinishLaunch() {
    router.showStartView()
  }
}
