//
//  SamplePresenter.swift
//  Clean-Architecture
//
//  Created by TTB on 13/2/2567 BE.
//  Copyright (c) 2567 BE TTB. All rights reserved.
//

import UIKit

protocol SamplePresenterProtocol {

}

class SamplePresenter {
    weak var viewController: SampleViewControllerProtocol?

    init(viewController: SampleViewControllerProtocol) {
        self.viewController = viewController
    }
}

// MARK: - SamplePresenterProtocol
extension SamplePresenter: SamplePresenterProtocol {

}
