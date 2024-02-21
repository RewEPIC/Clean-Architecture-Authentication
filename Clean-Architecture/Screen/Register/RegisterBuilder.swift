//
//  RegisterBuilder.swift
//  Clean-Architecture
//
//  Created by TTB on 19/2/2567 BE.
//  Copyright (c) 2567 BE TTB. All rights reserved.
//

import UIKit

struct RegisterBuilder { }

extension RegisterBuilder {
    static func build(parameter: [String: Any?]?) -> UIViewController {
        let bundle = Bundle(for: RegisterViewController.self)
        let identifier = String(describing: RegisterViewController.self)
        
        let storyboard = UIStoryboard(name: "Register", bundle: bundle)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? RegisterViewController else {
            fatalError("ViewController is undefined.")
        }
        
        let worker = RegisterWorker()
        let presenter = RegisterPresenter(viewController: viewController)
        let dataStore = RegisterDataStore()
        let interactor = RegisterInteractor(
            presenter: presenter,
            worker: worker,
            dataStore: dataStore
        )
        let router = RegisterRouter(dataStore: dataStore, viewController: viewController)
        
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
