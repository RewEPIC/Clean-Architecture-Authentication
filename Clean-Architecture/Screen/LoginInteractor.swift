//
//  LoginInteractor.swift
//  Clean-Architecture
//
//  Created by TTB on 13/2/2567 BE.
//  Copyright (c) 2567 BE TTB. All rights reserved.
//

import UIKit

protocol LoginDataStoreProtocol {
    
}

protocol LoginInteractorProtocol {
    
}

class LoginInteractor {
    var presenter: LoginPresenterProtocol
    var worker: LoginWorkerProtocol
    var dataStore: LoginDataStoreProtocol
    
    init(
        presenter: LoginPresenterProtocol,
        worker: LoginWorkerProtocol,
        dataStore: LoginDataStoreProtocol
    ) {
        self.presenter = presenter
        self.worker = worker
        self.dataStore = dataStore
    }
}

// MARK: - LoginInteractorProtocol
extension LoginInteractor: LoginInteractorProtocol {
    
}
