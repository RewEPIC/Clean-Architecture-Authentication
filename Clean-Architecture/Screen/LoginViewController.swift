//
//  LoginViewController.swift
//  Clean-Architecture
//
//  Created by TTB on 13/2/2567 BE.
//  Copyright (c) 2567 BE TTB. All rights reserved.
//

import UIKit

typealias LoginRouterInterface = LoginRouterProtocol & LoginDataPassingProtocol

protocol LoginViewControllerProtocol: AnyObject {
    
}

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    // MARK: - Public Properties
    var interactor: LoginInteractorProtocol!
    var router: LoginRouterInterface!
    
    // MARK: - Private Properties
    
    // MARK: - View Life Cycle Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Method Private
    
}

// MARK: - LoginViewControllerProtocol
extension LoginViewController: LoginViewControllerProtocol {
    
}
