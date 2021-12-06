//
//  MainPresenterTest.swift
//  CeibaApp-IOSTests
//
//  Created by UnLimited on 4/12/21.
//

import XCTest
import Foundation
@testable import CeibaApp_IOS

class MainPresenterTest: XCTestCase {
    
    var sut: MainPresenter!
        var viewControllerMock: MainDesplayLogicMock!
        
        override func setUp() {
            viewControllerMock = MainDesplayLogicMock()
            sut = MainPresenter()
            sut.viewController = viewControllerMock
        }
        
        func testPresentPostsHomeSuccess() {
            //Given
            let responseMock = [CaibaModels.GetMain.Response(id: 1, name: "ABC", email: "ABC", phone: "ABC")]
            
            let viewModel = CaibaModels.GetMain.ViewModel(caibaData: responseMock)
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
