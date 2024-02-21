//
//  SampleBuilder.swift
//  Clean-Architecture
//
//  Created by TTB on 13/2/2567 BE.
//  Copyright (c) 2567 BE TTB. All rights reserved.
//

import UIKit


struct SampleBuilder { }

extension SampleBuilder {
    static func build(parameter: [String: Any?]?) -> UIViewController {
        let bundle = Bundle(for: SampleViewController.self)
        let identifier = String(describing: SampleViewController.self)
        
        let storyboard = UIStoryboard(name: "Sample", bundle: bundle)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? SampleViewController else {
            fatalError("ViewController is undefined.")
        }
        
        let worker = SampleWorker()
        let presenter = SamplePresenter(viewController: viewController)
        let dataStore = SampleDataStore()
        let interactor = SampleInteractor(
            presenter: presenter,
            worker: worker,
            dataStore: dataStore
        )
        let router = SampleRouter(dataStore: dataStore, viewController: viewController)
        
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
