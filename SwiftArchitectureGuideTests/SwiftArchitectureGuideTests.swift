//
//  SwiftArchitectureGuideTests.swift
//  SwiftArchitectureGuideTests
//
//  Created by Joao Victor Garcia Leite Santana on 17/09/24.
//

import XCTest
@testable import SwiftArchitectureGuide

final class SwiftArchitectureGuideTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRegister() {
        _ = expectation(description: "Should perform register successfully (already registerd emails won't work)")
        
        let manager = UserManager(business: UserBusiness())
        let email = "teste@teste.com"
        let password = "12345678"
    
        var userModel: UserModel?

        manager.register(email: email, password: password) { success in
            print(success)
            userModel = success
        } errorHandler: { error in
            print(error)
        }
        
        waitForExpectations(timeout: 30) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout error: \(error)")
            }
            
            XCTAssertEqual(userModel != nil, true)
            XCTAssertEqual(userModel!.email, email)
         }
    }
    
    func testLogin() {
        _ = expectation(description: "Should perform login successfully")
        
        let manager = UserManager(business: UserBusiness())
        let email = "teste@teste.com"
        let password = "12345678"
    
        var userModel: UserModel?

        manager.login(email: email, password: password) { success in
            print(success)
            userModel = success
        } errorHandler: { error in
            print(error)
        }
        
        waitForExpectations(timeout: 30) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout error: \(error)")
            }
            
            XCTAssertEqual(userModel != nil, true)
            XCTAssertEqual(userModel!.email, email)
         }
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
