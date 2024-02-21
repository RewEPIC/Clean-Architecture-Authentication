//
//  LoginInteractor.swift
//  Clean-Architecture
//
//  Created by TTB on 13/2/2567 BE.
//  Copyright (c) 2567 BE TTB. All rights reserved.
//


protocol LoginDataStoreProtocol {
    
}

protocol LoginInteractorProtocol {
    func verificationLogin(request: LoginModel.SendLogin.Request)
}

class LoginInteractor {
    var presenter: LoginPresenterProtocol
    var worker: LoginWorkerProtocol
    var dataStore: LoginDataStoreProtocol
    
    init(
        presenter: LoginPresenterProtocol,
        worker: LoginWorkerProtocol,
        dataStore: LoginDataStoreProtocol
    ) {
        self.presenter = presenter
        self.worker = worker
        self.dataStore = dataStore
    }
}

// MARK: - LoginInteractorProtocol
extension LoginInteractor: LoginInteractorProtocol {
    
    func verificationLogin(request: LoginModel.SendLogin.Request) {
        worker.postAuthentication(request: .init(username: request.username, password: request.password), completion: { (result: Result) in
            switch result {
            case .success(let userToken):
                let user = TokenDecoder().decode(token: userToken.token,as: UserEntity.self)
                self.presenter.presentLogin(response: .init(dataResult: .success(name: user?.name ?? "Empty Name")))
            case .failure(let 
                          error):
                self.presenter.presentLogin(response: .init(dataResult: .error(message: error.localizedDescription)))
            }
        })
    }
    
    
}
