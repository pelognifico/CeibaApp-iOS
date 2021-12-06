//
//  HomeViewControllerTest.swift
//  CeibaApp-IOSTests
//
//  Created by UnLimited on 4/12/21.
//

import XCTest
import Foundation

@testable import CeibaApp_IOS

class HomeViewControllerTest: XCTestCase {
        var sut: MainViewController!
        var viewControllerMock: MainDesplayLogicMock!
        
        override func setUp() {
            super.setUp()
            
            viewControllerMock = MainDesplayLogicMock()
            sut = MainViewController()
        }
        
        //MARK: -- GetPosts
        func testGetPosts() {
            //Given
            let responseMock = [CaibaModels.GetMain.Response(id: 1, name: "ABC", email: "ABC", phone: "ABC")]
            
            let viewModel = CaibaModels.GetMain.ViewModel(caibaData: responseMock)
            let queue = DispatchQueue(label: "FileLoaderTests")
            
            viewControllerMock.displayInitialData(viewModel: viewModel, on: queue)
            
            //When
            queue.sync {
                sut.loadInitialData()
            }
            
            let result = viewControllerMock.isFunctionWasCalled
            
            //Then
            XCTAssertTrue((result))
        }
        
        //MARK: -- GetPostsFailure
        func testFailure() {
            //Given
            let error: CaibaError = .request
            let viewModel = CaibaModels.Error.ViewModel(error: error)
            let queue = DispatchQueue(label: "FileLoaderTests")
            viewControllerMock.displayError(viewModel: viewModel, on: queue)
            
            //When
            queue.sync {
                sut.displayError(viewModel: viewModel, on: queue)
            }
            
            let result = viewControllerMock.isFunctionWasCalled
            
            //Then
            XCTAssertTrue((result))
        }
    

}
