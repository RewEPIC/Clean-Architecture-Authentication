//
//  LoginWorker.swift
//  Clean-Architecture
//
//  Created by TTB on 13/2/2567 BE.
//  Copyright (c) 2567 BE TTB. All rights reserved.
//
import Alamofire

protocol LoginWorkerProtocol {
    func postAuthentication(request: LoginModel.SendLogin.Request, completion: @escaping (Result<UserTokenResponse,Error>) -> Void)
}

class LoginWorker: LoginWorkerProtocol {
    func postAuthentication(request: LoginModel.SendLogin.Request, completion: @escaping (Result<UserTokenResponse,Error>) -> Void) {
        APIProvider.shared.handler(
            path: .login(request: request),
            onSucess: { (response: UserTokenResponse) in
                completion(.success(response))
            },
            onError: { (error: Error) in
                completion(.failure(error))
            })
    }
    
    
}
