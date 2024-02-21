//
//  SampleRouter.swift
//  Clean-Architecture
//
//  Created by TTB on 13/2/2567 BE.
//  Copyright (c) 2567 BE TTB. All rights reserved.
//

import UIKit

protocol SampleDataPassingProtocol {
    var dataStore: SampleDataStoreProtocol { get }
}

protocol SampleRouterProtocol {
    
}

class SampleRouter: SampleDataPassingProtocol {
    
    weak var viewController: SampleViewController?
    
    var dataStore: SampleDataStoreProtocol
    
    init(
        dataStore: SampleDataStoreProtocol,
        viewController: SampleViewController
    ) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

// MARK: - SampleRouterProtocol
extension SampleRouter: SampleRouterProtocol {
    
}
