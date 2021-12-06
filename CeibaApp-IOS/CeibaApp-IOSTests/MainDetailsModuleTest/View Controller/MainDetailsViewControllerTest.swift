//
//  MainDetailsViewControllerTest.swift
//  CeibaApp-IOSTests
//
//  Created by UnLimited on 4/12/21.
//

import XCTest
import Foundation
@testable import CeibaApp_IOS

class MainDetailsViewControllerTest: XCTestCase {
    
    var sut: MailnDetailsViewController!
    var viewControllerMock: MainDetailsDisplayLogicMock!
    
    override func setUp() {
        super.setUp()
        
        viewControllerMock = MainDetailsDisplayLogicMock()
        sut = MailnDetailsViewController()
    }
    
    //MARK: -- GetPosts
    func testGetPosts() {
        //Given
        let responseMock = [CaibaDetailsModels.Posts.Response(userId: 1, id: 1, title: "ABC", body: "ABC")]
        
        let viewModel = CaibaDetailsModels.Posts.ViewModel(detailsData: responseMock)
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
