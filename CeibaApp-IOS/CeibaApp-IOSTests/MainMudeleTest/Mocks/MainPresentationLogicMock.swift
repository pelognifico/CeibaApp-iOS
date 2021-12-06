//
//  MainPresentationLogicMock.swift
//  CeibaApp-IOSTests
//
//  Created by UnLimited on 4/12/21.
//

import XCTest
@testable import CeibaApp_IOS

class MainPresentationLogicMock: MainPresentationLogic{
    
    var response: [CaibaModels.GetMain.Response]?
    var isFunctionWasCalled = false
    
    func presentInitialData(response: [CaibaModels.GetMain.Response]) {
        if response != nil {
            isFunctionWasCalled = true
        }
    }
    
    func presentError(response: CaibaModels.Error.Response) {
            isFunctionWasCalled = true
    }

   
}
