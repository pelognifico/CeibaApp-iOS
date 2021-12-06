//
//  MainSucessResponse.swift
//  CeibaApp-IOSTests
//
//  Created by UnLimited on 4/12/21.
//

import XCTest
@testable import CeibaApp_IOS

class MainSucessResponse: XCTestCase {

    var sut: MainWorker!
        var mainServiceProtocolMock: MainWorkerMock!
        
        override func setUp() {
            mainServiceProtocolMock = MainWorkerMock()
            sut = MainWorker(mainService: mainServiceProtocolMock)
        }
        
        //MARK: -- Test Posts
        func testGetPosts(){
            //Given
            let requestData = CaibaDetailsModels.Posts.Request()
            
            let dataMock = CaibaDetailsModels.Posts.Response(userId: 1, id: 1, title: "ABC", body: "ABC")
            let success : [CaibaDetailsModels.Posts.Response]? = .some([dataMock])
            
            //When
            mainServiceProtocolMock.resulGetPosts = .success(success!)
            
            //Then
            sut.postsMainDetails(request: requestData, completion: { result in
                switch result {
                case .success(let response):
                    XCTAssertNotNil(response)
                    XCTAssertEqual(response[0].userId, dataMock.userId)
                    XCTAssertEqual(response[0].id, dataMock.id)
                    XCTAssertEqual(response[0].title, dataMock.title)
                    XCTAssertEqual(response[0].body, dataMock.body)
                case .failure(_):
                    break
                }
            })
        }
        
        //MARK: -- Test Users
        func testGetUsers(){
            //Given
            let requestData = CaibaModels.GetMain.Request()
    
            let dataMock = CaibaModels.GetMain.Response(id: 1, name: "ABC", email: "ABC", phone: "ABC")
            let success : [CaibaModels.GetMain.Response]? = .some([dataMock])
            
            //When
            mainServiceProtocolMock.resulGetUsers = .success(success!)
            
            //Then
            sut.getMain(request: requestData, completion: { result in
                switch result {
                case .success(let response):
                    XCTAssertNotNil(response)
                    XCTAssertEqual(response[0].id, dataMock.id)
                    XCTAssertEqual(response[0].name, dataMock.name)
                    XCTAssertEqual(response[0].email, dataMock.email)
                    XCTAssertEqual(response[0].phone, dataMock.phone)
                case .failure(_):
                    break
                }
            })
        }

}
