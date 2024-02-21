//
//  LoginPresenterSpy.swift
//  Clean-Architecture
//
//  Created by Duangcharoen  on 20/2/2567 BE.
//

import Foundation
@testable import Clean_Architecture

class LoginPresenterSpy: LoginPresenterProtocol {
    
    var presentLoginIsCalled: Int = .zero
    var presentLoginResult: LoginModel.SendLogin.Response?
    
    func presentLogin(response: LoginModel.SendLogin.Response) {
        presentLoginIsCalled += 1
        presentLoginResult = response
    }
}
