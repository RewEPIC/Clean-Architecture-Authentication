//
//  RegisterRouter.swift
//  Clean-Architecture
//
//  Created by TTB on 19/2/2567 BE.
//  Copyright (c) 2567 BE TTB. All rights reserved.
//

import UIKit

protocol RegisterDataPassingProtocol {
    var dataStore: RegisterDataStoreProtocol { get }
}

protocol RegisterRouterProtocol {
    func navigateBack()
}

class RegisterRouter: RegisterDataPassingProtocol {
    
    weak var viewController: RegisterViewController?
    
    var dataStore: RegisterDataStoreProtocol
    
    init(
        dataStore: RegisterDataStoreProtocol,
        viewController: RegisterViewController
    ) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

// MARK: - RegisterRouterProtocol
extension RegisterRouter: RegisterRouterProtocol {
    func navigateBack() {
        self.viewController?.navigationController?.popViewController(animated: true)
    }
}
