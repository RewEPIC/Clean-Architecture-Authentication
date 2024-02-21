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
    func displayLogin(viewModel: LoginModel.SendLogin.ViewModel)
}

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var username: TextField!
    @IBOutlet private weak var password: TextField!
    @IBOutlet private weak var loginButton: Button!
    @IBOutlet private weak var registerButton: Button!
    @IBOutlet private weak var helperText: HelperText!
    // MARK: - Public Properties
    var interactor: LoginInteractorProtocol!
    var router: LoginRouterInterface!
    
    // MARK: - Private Properties
    
    // MARK: - View Life Cycle Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Method Private
    private func setup() {
        username.setup(viewModel: TextFieldViewModel(titleText: "Username", placeholder: "Username"))
        password.setup(viewModel: TextFieldViewModel(titleText: "Password", placeholder: "Password", isSecretText: true))
        loginButton.setup(viewModel: ButtonViewModel(titleText: "Login", buttonSize: .large))
        registerButton.setup(viewModel: ButtonViewModel(titleText: "Register", buttonSize: .large))
        helperText.setup(viewModel: HelperTextViewModel(titleText: "", style: .error))
    }
}
// MARK: - Action
extension LoginViewController {
    @IBAction func loginButtonDidTapped(_ sender: Any) {
        let request = LoginModel.SendLogin.Request(username: username.textField.text ?? "", password: password.textField.text ?? "")
        interactor?.verificationLogin(request: request)
    }
    @IBAction func registerButtonDidTapped(_ sender: Any) {
        router.navigateToRegisterScreen()
    }
}

// MARK: - LoginViewControllerProtocol
extension LoginViewController: LoginViewControllerProtocol {
    
    func displayLogin(viewModel: LoginModel.SendLogin.ViewModel) {
        switch viewModel.contentResult {
        case .success(let name):
            helperText.show(titleText: "Welcome, \(name)", style: .success)
        case .error(let message):
            helperText.show(titleText: "Login failure", style: .error)
        }
    }
}
