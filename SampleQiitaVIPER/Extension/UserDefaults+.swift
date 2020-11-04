//
//  UserDefaults+.swift
//  SampleQiitaVIPER
//
//  Created by sakiyamaK on 2020/11/04.
//

import Foundation

extension UserDefaults {
  private var qiitaAccessTokenKey: String { "qiitaAccessTokenKey" }
  var qiitaAccessToken: String {
    get {
      self.string(forKey: qiitaAccessTokenKey) ?? ""
    }
    set {
      self.setValue(newValue, forKey: qiitaAccessTokenKey)
    }
  }
}
