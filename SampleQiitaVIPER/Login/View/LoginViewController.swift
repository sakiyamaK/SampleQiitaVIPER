//
//  LoginViewController.swift
//  SampleQiitaVIPER
//
//  Created by sakiyamak on 2020/11/1.
//  Copyright © 2020 sakiyamak. All rights reserved.
//

import UIKit
import SafariServices

protocol LoginView: AnyObject {

}

final class LoginViewController: UIViewController {
  var presenter: LoginPresentation!

  @IBOutlet private weak var qiitaOAuthButton: UIButton! {
    didSet {
      let tap: UITapGestureRecognizer = .init(target: self, action: #selector(tapOAuthButton(_:)))
      qiitaOAuthButton.addGestureRecognizer(tap)
    }
  }

  static func makeFromStoryboard() -> LoginViewController? {
    guard let vc = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController() as? LoginViewController else {
      return nil
    }
    return vc
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    presenter.viewDidLoad()
  }
}

extension LoginViewController: LoginView {

}


private extension LoginViewController {
  @objc func tapOAuthButton(_ sender: UIButton) {
    print(UserDefaults.standard.qiitaAccessToken)
    guard UserDefaults.standard.qiitaAccessToken.count == 0 && UIApplication.shared.canOpenURL(API.shared.oAuthURL) else {
      return
    }

    UIApplication.shared.open(API.shared.oAuthURL, options: [:], completionHandler: nil)
  }
}
