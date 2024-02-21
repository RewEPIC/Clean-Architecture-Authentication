//
//  LoginPresenter.swift
//  Clean-Architecture
//
//  Created by TTB on 13/2/2567 BE.
//  Copyright (c) 2567 BE TTB. All rights reserved.
//

import UIKit

protocol LoginPresenterProtocol {
    func presentLogin(response: LoginModel.SendLogin.Response)
}

class LoginPresenter {
    weak var viewController: LoginViewControllerProtocol?

    init(viewController: LoginViewControllerProtocol) {
        self.viewController = viewController
    }
}

// MARK: - LoginPresenterProtocol
extension LoginPresenter: LoginPresenterProtocol {
    func presentLogin(response: LoginModel.SendLogin.Response) {
        switch response.dataResult {
        case .success(let name):
            self.viewController?.displayLogin(viewModel: .init(contentResult: .success(name: name)))
        case .error(let error):
            self.viewController?.displayLogin(viewModel: .init(contentResult: .error(message: error)))
        }
    }
    
}
