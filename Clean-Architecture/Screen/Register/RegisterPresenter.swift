//
//  RegisterPresenter.swift
//  Clean-Architecture
//
//  Created by TTB on 19/2/2567 BE.
//  Copyright (c) 2567 BE TTB. All rights reserved.
//

import UIKit

protocol RegisterPresenterProtocol {

}

class RegisterPresenter {
    weak var viewController: RegisterViewControllerProtocol?

    init(viewController: RegisterViewControllerProtocol) {
        self.viewController = viewController
    }
}

// MARK: - RegisterPresenterProtocol
extension RegisterPresenter: RegisterPresenterProtocol {

}
