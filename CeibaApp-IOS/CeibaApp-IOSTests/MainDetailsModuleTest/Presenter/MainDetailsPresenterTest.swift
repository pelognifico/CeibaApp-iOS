//
//  MainDetailsPresenterTest.swift
//  CeibaApp-IOSTests
//
//  Created by UnLimited on 5/12/21.
//

import XCTest
import Foundation
@testable import CeibaApp_IOS

class MainDetailsPresenterTest: XCTestCase {

        var sut: MainDetailsPresenter!
        var viewControllerMock: MainDetailsDisplayLogicMock!
        
        override func setUp() {
            viewControllerMock = MainDetailsDisplayLogicMock()
            sut = MainDetailsPresenter()
            sut.viewController = viewControllerMock
        }
        
        func testPresentPostsHomeSuccess() {
            //Given
            let responseMock = [CaibaDetailsModels.Posts.Response(userId: 1, id: 1, title: "ABC", body: "ABC")]
            
            let viewModel = CaibaDetailsModels.Posts.ViewModel(detailsData: responseMock)
            let queue = DispatchQueue(label: "FileLoaderTests")
            viewControllerMock.displayInitialData(viewModel: viewModel, on: queue)
            
            //When
            queue.sync {
                sut.presentInitialData(response: responseMock)
            }
            
            let result = viewControllerMock.isFunctionWasCalled
            
            //Then
            XCTAssertTrue((result))
        }
        
        func testPresentPostsHomeFailure() {
            //Given
            let error: CaibaError = .request
            let responseMock = CaibaModels.Error.Response(error: error)
            let viewModel = CaibaModels.Error.ViewModel(error: error)
            let queue = DispatchQueue(label: "FileLoaderTests")
            viewControllerMock.displayError(viewModel: viewModel, on: queue)
            
            //When
            queue.sync {
                sut.presentError(response: responseMock)
            }
            
            let result = viewControllerMock.isFunctionWasCalled
            
            //Then
            XCTAssertTrue((result))
        }

}
