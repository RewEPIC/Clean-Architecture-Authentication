//
//  LoginPresenter.swift
//  Clean-Architecture
//
//  Created by TTB on 13/2/2567 BE.
//  Copyright (c) 2567 BE TTB. All rights reserved.
//

import UIKit

protocol LoginPresenterProtocol {

}

class LoginPresenter {
    weak var viewController: LoginViewControllerProtocol?

    init(viewController: LoginViewControllerProtocol) {
        self.viewController = viewController
    }
}

// MARK: - LoginPresenterProtocol
extension LoginPresenter: LoginPresenterProtocol {

}
