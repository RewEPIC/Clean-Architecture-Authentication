//
//  LoginWorkerStub.swift
//  Clean-Architecture
//
//  Created by Duangcharoen  on 20/2/2567 BE.
//

import Foundation
@testable import Clean_Architecture

class LoginWorkerStub: LoginWorkerProtocol {
    
    var postAuthenticationResultStub: Result<UserTokenResponse, Error>?
    func postAuthentication(request: LoginModel.SendLogin.Request, completion: @escaping (Result<UserTokenResponse, Error>) -> Void) {
        if let postAuthenticationResultStub {
            completion(postAuthenticationResultStub)
        }
    }
}
