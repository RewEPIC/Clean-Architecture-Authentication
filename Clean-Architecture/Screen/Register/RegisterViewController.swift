//
//  RegisterViewController.swift
//  Clean-Architecture
//
//  Created by TTB on 19/2/2567 BE.
//  Copyright (c) 2567 BE TTB. All rights reserved.
//

import UIKit

typealias RegisterRouterInterface = RegisterRouterProtocol & RegisterDataPassingProtocol

protocol RegisterViewControllerProtocol: AnyObject {
    
}


class RegisterViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var confirmPassword: TextFieldHelperText!
    @IBOutlet weak var password: TextFieldHelperText!
    @IBOutlet weak var email: TextFieldHelperText!
    @IBOutlet weak var name: TextFieldHelperText!
    @IBOutlet weak var username: TextFieldHelperText!
    // MARK: - Public Properties
    var interactor: RegisterInteractorProtocol!
    var router: RegisterRouterInterface!
    
    // MARK: - Private Properties
    
    // MARK: - View Life Cycle Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavbar()
    }
    
    // MARK: - Method Private
    private func setupUI() {
        username.setup(viewModel: TextFieldHelperTextViewModel(
            titleText: "Username",
            placeholder: "Username")
        )
        username.updateLayout(state: .error(errorMessage: "Error Message"))
        name.setup(viewModel: TextFieldHelperTextViewModel(
            titleText: "Name",
            placeholder: "Name")
        )
        name.updateLayout(state: .default(helperMessage: "Hint Message"))
        email.setup(viewModel: TextFieldHelperTextViewModel(
            titleText: "Email",
            placeholder: "Email")
        )
        password.setup(viewModel: TextFieldHelperTextViewModel(
            titleText: "Password",
            placeholder: "Password",
            isSecretText: true)
        )
        confirmPassword.setup(viewModel: TextFieldHelperTextViewModel(
            titleText: "Confirm Password",
            placeholder: "Confirm Password",
            isSecretText: true)
        )
    }
    private func setupNavbar() {
        navigationBar.setup(titleText: "Register account")
        navigationBar.delegate = self
    }
}

// MARK: - NavigationBar Delegates
extension RegisterViewController: NavigationBarDelegate {
    func navigateButtonDidTapped() {
        router?.navigateBack()
    }
}

// MARK: - RegisterViewControllerProtocol
extension RegisterViewController: RegisterViewControllerProtocol {

}
