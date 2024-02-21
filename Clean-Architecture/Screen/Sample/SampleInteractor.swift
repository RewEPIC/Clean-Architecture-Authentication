//
//  SampleInteractor.swift
//  Clean-Architecture
//
//  Created by TTB on 13/2/2567 BE.
//  Copyright (c) 2567 BE TTB. All rights reserved.
//

import UIKit

protocol SampleDataStoreProtocol {
    
}

protocol SampleInteractorProtocol {
    
}

class SampleInteractor {
    var presenter: SamplePresenterProtocol
    var worker: SampleWorkerProtocol
    var dataStore: SampleDataStoreProtocol
    
    init(
        presenter: SamplePresenterProtocol,
        worker: SampleWorkerProtocol,
        dataStore: SampleDataStoreProtocol
    ) {
        self.presenter = presenter
        self.worker = worker
        self.dataStore = dataStore
    }
}

// MARK: - SampleInteractorProtocol
extension SampleInteractor: SampleInteractorProtocol {
    
}
