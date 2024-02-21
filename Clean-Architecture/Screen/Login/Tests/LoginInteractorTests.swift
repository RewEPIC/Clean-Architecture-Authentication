//
//  LoginInteractorTests.swift
//  Clean-ArchitectureTests
//
//  Created by Duangcharoen  on 20/2/2567 BE.
//

import XCTest
@testable import Clean_Architecture

final class LoginInteractorTests: XCTestCase {
    
    var sut: LoginInteractorProtocol!
    var presenter: LoginPresenterSpy!
    var worker: LoginWorkerStub!
    var dataStore: LoginDataStoreSpy!

    override func setUp() {
        super.setUp()
        
        presenter = LoginPresenterSpy()
        worker = LoginWorkerStub()
        dataStore = LoginDataStoreSpy()
        sut = LoginInteractor(presenter: presenter, worker: worker, dataStore: dataStore)
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testVerifiedLogin_withUsernameAndPassword_shouldReturnSuccess() {
        // Given
        let request = LoginModel.SendLogin.Request(username: "mock", password: "mock")
        worker.postAuthenticationResultStub = .success(UserTokenResponse(token: "eyJhbGciOiJIUzUxMiJ9.eyJhdXQiOlsiYWRtaW4iXSwic3ViIjoic2FuaXQiLCJuYW1lIjoiU2FuaXQgU2lyaXNhd2F0dmF0YW5hIiwidHlwIjoiQUNDRVNTX1RPS0VOIiwiZXhwIjoxNzA4NDg5NjA0LCJpYXQiOjE3MDg0ODc4MDQsImVtYWlsIjoic2FuaXQuc2lyQGttdXR0LmFjLnRoIn0.NvEK28_Nr4N7SO7QAd6uy0MNlricvWnayYsE9DohakPEF38qFAgaE6O6POWyQL7wgkU1s-s0O9qMC6XBLQ3Q6w",
                                                                         refreshToken: "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzYW5pdCIsInR5cCI6IlJFRlJFU0hfVE9LRU4iLCJleHAiOjE3MDg0OTE0MDQsImlhdCI6MTcwODQ4NzgwNH0.GMRkoxIaMNaEAGABH2nkm7WC9JqLlw8hLT-7PdFhx33ZArFbtCd5w2aic29QNsGpb0V1YI3xMkYpnB1h4TaXdQ"))

        // When
        sut.verificationLogin(request: request)
        
        // Then
        XCTAssertEqual(1, presenter.presentLoginIsCalled, "Interactor should call presenter.presentLogin only 1 time")
        
        switch presenter.presentLoginResult?.dataResult {
        case .success(let name):
            XCTAssertEqual("Sanit Sirisawatvatana", name, "Name in token should be Sanit Sirisawatvatana")
        default:
            XCTFail("Invalid token")
        }
        
    }
    
    func testVerifiedLogin_withUsernameAndPassword_shouldReturnError() {
        // Given
        let request = LoginModel.SendLogin.Request(username: "mock", password: "mock")
        worker.postAuthenticationResultStub = .failure( NSError(domain: "error message", code: 1) )

        // When
        sut.verificationLogin(request: request)
        
        // Then
        XCTAssertEqual(1, presenter.presentLoginIsCalled, "Interactor should call presenter.presentLogin only 1 time")
        
        switch presenter.presentLoginResult?.dataResult {
        case .error(let message):
            XCTAssertEqual("The operation couldn’t be completed. (error message error 1.)", message, "Should be error")
        default:
            XCTFail("Invalid token")
        }
        
    }
    
    func testVerifiedLogin_withInvalidToken_shouldReturnEmptyName() {
        // Given
        let request = LoginModel.SendLogin.Request(username: "mock", password: "mock")
        worker.postAuthenticationResultStub =  .success(UserTokenResponse(token: "invalidToken",
                                                                          refreshToken: "adminRefreshToken"))

        // When
        sut.verificationLogin(request: request)
        
        // Then
        XCTAssertEqual(1, presenter.presentLoginIsCalled, "Interactor should call presenter.presentLogin only 1 time")
        
        switch presenter.presentLoginResult?.dataResult {
        case .success(let name):
            XCTAssertEqual("Empty Name", name, "Name in token should be Empty Name")
        default:
            XCTFail("Invalid token")
        }
        
    }
}
