//
//  MainDetailsPresentationLogicMock.swift
//  CeibaApp-IOSTests
//
//  Created by UnLimited on 4/12/21.
//

import XCTest
@testable import CeibaApp_IOS

final class MainDetailsPresentationLogicMock: MainDetailsPresentationLogic {
    var responseUsers: [CaibaDetailsModels.Posts.Response]?
    var isFunctionWasCalled = false
    
    func presentInitialData(response: [CaibaDetailsModels.Posts.Response]) {
        if responseUsers != nil {
            isFunctionWasCalled = true
        }
    }
    
    func presentError(response: CaibaModels.Error.Response) {
        isFunctionWasCalled = true
    }
    

}
