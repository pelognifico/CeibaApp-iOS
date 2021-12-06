//
//  MainWorkerMock.swift
//  CeibaApp-IOSTests
//
//  Created by UnLimited on 4/12/21.
//

import XCTest

@testable import CeibaApp_IOS

class MainWorkerMock: MainServiceProtocol{
    
    var resulGetUsers: (Result<[CaibaModels.GetMain.Response], CaibaError>)?
    var resulGetPosts: (Result<[CaibaDetailsModels.Posts.Response], CaibaError>)?
    
    var isFunctionWasCalled = false
    
    func getMain(request: CaibaModels.GetMain.Request, completion: @escaping (Result<[CaibaModels.GetMain.Response], CaibaError>) -> Void) {
        if let result = resulGetUsers {
            isFunctionWasCalled = true
            completion(result)
        }
    }
    
    func postsMainDetails(request: CaibaDetailsModels.Posts.Request, completion: @escaping (Result<[CaibaDetailsModels.Posts.Response], CaibaError>) -> Void) {
        if let result = resulGetPosts {
            isFunctionWasCalled = true
            completion(result)
        }
    }
    
}
