//
//  RegisterInteractor.swift
//  Clean-Architecture
//
//  Created by TTB on 19/2/2567 BE.
//  Copyright (c) 2567 BE TTB. All rights reserved.
//

import UIKit

protocol RegisterDataStoreProtocol {
    
}

protocol RegisterInteractorProtocol {
    
}

class RegisterInteractor {
    var presenter: RegisterPresenterProtocol
    var worker: RegisterWorkerProtocol
    var dataStore: RegisterDataStoreProtocol
    
    init(
        presenter: RegisterPresenterProtocol,
        worker: RegisterWorkerProtocol,
        dataStore: RegisterDataStoreProtocol
    ) {
        self.presenter = presenter
        self.worker = worker
        self.dataStore = dataStore
    }
}

// MARK: - RegisterInteractorProtocol
extension RegisterInteractor: RegisterInteractorProtocol {
    
}
