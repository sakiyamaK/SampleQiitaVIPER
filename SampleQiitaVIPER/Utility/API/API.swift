//
//  API.swift
//  SampleQiitaVIPER
//
//  Created by sakiyamaK on 2020/11/04.
//

import Foundation
import Alamofire

enum APIError: Error {
  case postAccessToken
}

final class API {
  static let shared = API()
  private init() {}

  private let host = "https://qiita.com/api/v2"
  private let clientID = "7a4eae27a05e5c9d147894898c954570dce5bb4f"
  private let clientSecret = "856bf10d7fbd65f09f2a54b518a18a884299dd71"
  let qiitState = "bb17785d811bb1913ef54b0a7657de780defaa2d"

  enum  URLParameterName: String {
    case clientID = "client_id"
    case clientSecret = "client_secret"
    case scope = "scope"
    case state = "state"
    case code = "code"
  }

  var oAuthURL: URL {
    let endPoint = "/oauth/authorize"
    return URL(string: host + endPoint + "?" +
                "\(URLParameterName.clientID.rawValue)=\(clientID)" + "&" +
               "\(URLParameterName.scope.rawValue)=read_qiita+write_qiita" + "&" +
                "\(URLParameterName.state.rawValue)=\(qiitState)")!
  }

  func postAccessToken(code: String, completion: ((Error?) -> Void)? = nil) {
    let endPoint = "/access_tokens"
    guard let url = URL(string: host + endPoint + "?" +
                          "\(URLParameterName.clientID.rawValue)=\(clientID)" + "&" +
                          "\(URLParameterName.clientSecret.rawValue)=\(clientSecret)" + "&" +
                          "\(URLParameterName.code)=\(code)") else {
      completion?(APIError.postAccessToken)
      return
    }

    AF.request(url, method: .post).response { (response) in
      print(response)
      print("--------")
    }
  }
}
