//
//  AppDelegate.swift
//  SampleQiitaVIPER
//
//  Created by sakiyamaK on 2020/11/01.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  let appPresenter = AppRouter.assembleModules(window: UIWindow(frame: UIScreen.main.bounds))

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    appPresenter.didFinishLaunch()
    return true
  }

  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    guard let queryItems = URLComponents(string: url.absoluteString)?.queryItems,
          let code = queryItems.first(where: {$0.name == "code"})?.value,
          let getState = queryItems.first(where: {$0.name == "state"})?.value,
          getState == API.shared.qiitState
    else {
      return true
    }
    API.shared.postAccessToken(code: code)
    return true
  }
}

