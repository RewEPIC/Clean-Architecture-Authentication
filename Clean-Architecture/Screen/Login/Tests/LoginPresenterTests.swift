//
//  LoginPresenterTests.swift
//  Clean-ArchitectureTests
//
//  Created by Duangcharoen  on 21/2/2567 BE.
//

import XCTest
@testable import Clean_Architecture

final class LoginPresenterTests: XCTestCase {
    
    var viewController: LoginViewControllerSpy!
    var sut: LoginPresenter!
    
    override func setUp() {
        super.setUp()
        
        viewController = LoginViewControllerSpy()
        sut = LoginPresenter(viewController: viewController)
    }
    
    override func tearDown() {
        super.tearDown()
        
        viewController = nil
        sut = nil
    }
    
    func testPresentLogin_withSuccessAndHaveName_shouldShowName() {
        // Given
        let response = LoginModel.SendLogin.Response(dataResult: .success(name: "mock"))
        
        // When
        sut.presentLogin(response: response)
        
        // Then
        XCTAssertEqual(1, viewController.displayLoginIsCalled, "Presenter should call viewController.displayLogin only 1 time")
        switch viewController.displayLoginResult?.contentResult {
        case .success(let name):
            XCTAssertEqual("mock", name, "Name should return mock")
        default:
            XCTFail()
        }
    }
    
    func testPresentLogin_withErrorAndErrorMessage_shouldError() {
        // Given
        let response = LoginModel.SendLogin.Response(dataResult: .error(message: "error message"))
        
        // When
        sut.presentLogin(response: response)
        
        // Then
        XCTAssertEqual(1, viewController.displayLoginIsCalled, "Presenter should call viewController.displayLogin only 1 time")
        switch viewController.displayLoginResult?.contentResult {
        case .error(let message):
            XCTAssertEqual("error message", message, "Error should return error message")
        default:
            XCTFail()
        }
    }
    

}
