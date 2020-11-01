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
}

