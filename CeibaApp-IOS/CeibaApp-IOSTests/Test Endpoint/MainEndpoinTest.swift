//
//  MainEndpoinTest.swift
//  CeibaApp-IOSTests
//
//  Created by UnLimited on 4/12/21.
//

import XCTest

@testable import CeibaApp_IOS

class MainEndpoinTest: XCTestCase {

    var sut: MainEndpoint!
    
//    MARK: -Get Method
    
    func testGetPosts(){
        sut = .postDetails
        
        XCTAssertEqual(sut.method, .get)
        XCTAssertEqual(sut.path, "posts")
        XCTAssertNil(sut.parameter)
    }
    
    func testGetUsers(){
        sut = .getUser
        
        XCTAssertEqual(sut.method, .get)
        XCTAssertEqual(sut.path, "users")
        XCTAssertNil(sut.parameter)
    }

}
