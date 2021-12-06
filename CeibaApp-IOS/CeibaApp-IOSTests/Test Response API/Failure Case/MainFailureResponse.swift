//
//  MainFailureResponse.swift
//  CeibaApp-IOSTests
//
//  Created by UnLimited on 4/12/21.
//

import XCTest
@testable import CeibaApp_IOS

class MainFailureResponse: XCTestCase {

    var sut: MainWorker!
    var mainServiceProtocolMock: MainWorkerMock!
    
    override func setUp() {
        mainServiceProtocolMock = MainWorkerMock()
        sut = MainWorker(mainService: mainServiceProtocolMock )
    }

//    MARK: -- Test Posts
    
    func testGetPosts(){
//        Given
        let requestData = CaibaDetailsModels.Posts.Request()
        let failure: CaibaError = .request
        
//       When
        mainServiceProtocolMock.resulGetPosts = .failure(failure)
        
        //Then
        sut.postsMainDetails(request: requestData, completion: { result in
            switch result {
            case .success(_):
                break
            case .failure(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(error.localizedDescription, failure.localizedDescription)
            }
        })
    }
            
    //MARK: -- Test Users
    func testGetUsers(){
        //Given
        let requestData = CaibaModels.GetMain.Request()
        let failure : CaibaError = .request
        
        //When
        mainServiceProtocolMock.resulGetUsers = .failure(failure)
        
        //Then
        sut.getMain(request: requestData, completion: { result in
            switch result {
            case .success(_):
                break
            case .failure(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(error.localizedDescription, failure.localizedDescription)
            }
        })
    }
    
}
