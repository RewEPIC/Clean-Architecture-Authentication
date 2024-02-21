//
//  LoginRouter.swift
//  Clean-Architecture
//
//  Created by TTB on 13/2/2567 BE.
//  Copyright (c) 2567 BE TTB. All rights reserved.
//

import UIKit

protocol LoginDataPassingProtocol {
    var dataStore: LoginDataStoreProtocol { get }
}

protocol LoginRouterProtocol {
    
}

class LoginRouter: LoginDataPassingProtocol {
    
    weak var viewController: LoginViewController?
    
    var dataStore: LoginDataStoreProtocol
    
    init(
        dataStore: LoginDataStoreProtocol,
        viewController: LoginViewController
    ) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

// MARK: - LoginRouterProtocol
extension LoginRouter: LoginRouterProtocol {
    
}
