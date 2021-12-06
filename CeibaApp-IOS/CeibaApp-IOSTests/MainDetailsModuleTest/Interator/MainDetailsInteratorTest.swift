//
//  MainDetailsInteratorTest.swift
//  CeibaApp-IOSTests
//
//  Created by UnLimited on 5/12/21.
//

import XCTest
import Foundation
@testable import CeibaApp_IOS

class MainDetailsInteratorTest: XCTestCase {

    var sut: MainDetailsInteractor!
        var postsHomePresenterMock: MainWorkerMock!

        override func setUp() {
            postsHomePresenterMock = MainWorkerMock()
            sut = MainDetailsInteractor(worker: postsHomePresenterMock)
        }

        func testPostsHomeSuccess() {
            //Given
            let requestData = CaibaDetailsModels.Posts.Request()
            let responseMock = [CaibaDetailsModels.Posts.Response(userId: 1, id: 1, title: "ABC", body: "ABC")]

            postsHomePresenterMock.resulGetPosts = .success(responseMock)
            postsHomePresenterMock.isFunctionWasCalled = false

            //When
            sut.loadInitialData(request: requestData)
            let result = postsHomePresenterMock.isFunctionWasCalled

            //Then
            XCTAssertTrue(result)
        }

        func testSmallWorldFailure() {
            //Given
            let requestData = CaibaDetailsModels.Posts.Request()
            let failure : CaibaError = .request

            postsHomePresenterMock.resulGetPosts = .failure(failure)
            postsHomePresenterMock.isFunctionWasCalled = false

            //When
            sut.loadInitialData(request: requestData)
            let result = postsHomePresenterMock.isFunctionWasCalled

            //Then
            XCTAssertTrue(result)
        }
}
