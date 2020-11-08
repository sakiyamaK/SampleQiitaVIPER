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
  case getAuthenticatedUserItems
}

protocol APIClient: AnyObject {
  var oAuthURL: URL { get }
  func postAccessToken(code: String, completion: ((Result<AccessTokenEntity, Error>) -> Void)?)
  func getAuthenticatedUserItems(completion: ((Result<[QiitaItemEntity], Error>) -> Void)?)
}

final class API {
  static let shared = API()
  private init() {}

  private let host = "https://qiita.com/api/v2"
  private let clientID = "<https://qiita.com/settings/applications で登録した値>"
  private let clientSecret = "<https://qiita.com/settings/applications で登録した値>"
  let qiitState = "bb17785d811bb1913ef54b0a7657de780defaa2d"

  static let jsonDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    decoder.dateDecodingStrategy = .iso8601
    return decoder
  }()

  enum  URLParameterName: String {
    case clientID = "client_id"
    case clientSecret = "client_secret"
    case scope = "scope"
    case state = "state"
    case code = "code"
  }
}

extension API: APIClient {

  var oAuthURL: URL {
    let endPoint = "/oauth/authorize"
    return URL(string: host + endPoint + "?" +
                "\(URLParameterName.clientID.rawValue)=\(clientID)" + "&" +
               "\(URLParameterName.scope.rawValue)=read_qiita+write_qiita" + "&" +
                "\(URLParameterName.state.rawValue)=\(qiitState)")!
  }

  func postAccessToken(code: String, completion: ((Result<AccessTokenEntity, Error>) -> Void)? = nil) {
    let endPoint = "/access_tokens"
    guard let url = URL(string: host + endPoint) else {
      completion?(.failure(APIError.postAccessToken))
      return
    }

    let parameters = [
      URLParameterName.clientID.rawValue: clientID,
      URLParameterName.clientSecret.rawValue: clientSecret,
      URLParameterName.code.rawValue: code
    ]

    AF.request(url, method: .post, parameters: parameters).responseJSON { (response) in
      do {
        guard
          let _data = response.data else {
          completion?(.failure(APIError.postAccessToken))
          return
        }
        let accessToken = try API.jsonDecoder.decode(AccessTokenEntity.self, from: _data)
        print(accessToken)
        completion?(.success(accessToken))
      } catch let error {
        completion?(.failure(error))
      }
    }
  }

  func getAuthenticatedUserItems(completion: ((Result<[QiitaItemEntity], Error>) -> Void)? = nil) {
    let endPoint = "/authenticated_user/items"
    guard let url = URL(string: host + endPoint),
          UserDefaults.standard.qiitaAccessToken.count > 0 else {
      completion?(.failure(APIError.getAuthenticatedUserItems))
      return
    }
    let headers: HTTPHeaders = [
      "Authorization": "Bearer \(UserDefaults.standard.qiitaAccessToken)"
    ]
    let parameters = [
      "page": 1,
      "per_page": 20
    ]

    AF.request(url, method: .get, parameters: parameters, headers: headers).responseJSON { (response) in
      do {
        guard
          let _data = response.data else {
          completion?(.failure(APIError.getAuthenticatedUserItems))
          return
        }
        let items = try API.jsonDecoder.decode([QiitaItemEntity].self, from: _data)
        completion?(.success(items))
      } catch let error {
        completion?(.failure(error))
      }
    }
  }
}
