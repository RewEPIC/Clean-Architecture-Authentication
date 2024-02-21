//
//  LoginViewControllerSpy.swift
//  Clean-Architecture
//
//  Created by Duangcharoen  on 21/2/2567 BE.
//

import Foundation
@testable import Clean_Architecture

class LoginViewControllerSpy: LoginViewControllerProtocol {
    
    var displayLoginIsCalled: Int = .zero
    var displayLoginResult: LoginModel.SendLogin.ViewModel?
    func displayLogin(viewModel: LoginModel.SendLogin.ViewModel) {
        displayLoginIsCalled += 1
        displayLoginResult = viewModel
    }
}
