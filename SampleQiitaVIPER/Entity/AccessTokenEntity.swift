//
//  File.swift
//  SampleQiitaVIPER
//
//  Created by sakiyamaK on 2020/11/05.
//

import Foundation

struct AccessTokenEntity: Decodable {
  let clientId: String
  let scopes: [String]
  let token: String
}
