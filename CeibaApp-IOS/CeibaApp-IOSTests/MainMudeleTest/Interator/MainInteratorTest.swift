//
//  MainInteratorTest.swift
//  CeibaApp-IOSTests
//
//  Created by UnLimited on 4/12/21.
//

import XCTest
import Foundation
@testable import CeibaApp_IOS

class MainInteratorTest: XCTestCase {

    var sut: MainInteractor!
        var postsHomePresenterMock: MainWorkerMock!

        override func setUp() {
            postsHomePresenterMock = MainWorkerMock()
            sut = MainInteractor(worker: postsHomePresenterMock)
        }

        func testPostsHomeSuccess() {
            //Given
            let requestData = CaibaModels.GetMain.Request()
            let responseMock = [CaibaModels.GetMain.Response(id: 1, name: "ABC", email: "ABC", phone: "ABC")]

            postsHomePresenterMock.resulGetUsers = .success(responseMock)
            postsHomePresenterMock.isFunctionWasCalled = false

            //When
            sut.loadInitialData(request: requestData)
            let result = postsHomePresenterMock.isFunctionWasCalled

            //Then
            XCTAssertTrue(result)
        }

        func testSmallWorldFailure() {
            //Given
            let requestData = CaibaModels.GetMain.Request()
            let failure : CaibaError = .request

            postsHomePresenterMock.resulGetUsers = .failure(failure)
            postsHomePresenterMock.isFunctionWasCalled = false

            //When
            sut.loadInitialData(request: requestData)
            let result = postsHomePresenterMock.isFunctionWasCalled

            //Then
            XCTAssertTrue(result)
        }
}
