//
//  QiitaItemEntity.swift
//  SampleQiitaVIPER
//
//  Created by sakiyamaK on 2020/11/08.
//

import Foundation

struct QiitaItemEntity: Codable {
  var urlStr: String
  var title: String

  enum CodingKeys: String, CodingKey {
    case urlStr = "url"
    case title = "title"
  }
  var url: URL? { URL.init(string: urlStr) }
}
