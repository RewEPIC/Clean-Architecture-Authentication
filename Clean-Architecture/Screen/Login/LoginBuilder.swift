//
//  LoginBuilder.swift
//  Clean-Architecture
//
//  Created by TTB on 13/2/2567 BE.
//  Copyright (c) 2567 BE TTB. All rights reserved.
//

import UIKit

struct LoginBuilder { }

extension LoginBuilder {
    static func build(parameter: [String: Any?]?) -> UIViewController {
        let bundle = Bundle(for: LoginViewController.self)
        let identifier = String(describing: LoginViewController.self)
        
        let storyboard = UIStoryboard(name: "Login", bundle: bundle)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? LoginViewController else {
            fatalError("ViewController is undefined.")
        }
        
        let worker = LoginWorker()
        let presenter = LoginPresenter(viewController: viewController)
        let dataStore = LoginDataStore()
        let interactor = LoginInteractor(
            presenter: presenter,
            worker: worker,
            dataStore: dataStore
        )
        let router = LoginRouter(dataStore: dataStore, viewController: viewController)
        
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
