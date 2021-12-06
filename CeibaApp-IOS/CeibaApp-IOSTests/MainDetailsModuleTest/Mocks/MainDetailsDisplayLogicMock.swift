//
//  MainDetailsDisplayLogicMock.swift
//  CeibaApp-IOSTests
//
//  Created by UnLimited on 4/12/21.
//

import XCTest
@testable import CeibaApp_IOS

final class MainDetailsDisplayLogicMock: MainDetailsDisplayLogic {
 
    var viewModelDisplayUsers: CaibaDetailsModels.Posts.ViewModel?

        var isFunctionWasCalled = false
    
    func displayInitialData(viewModel: CaibaDetailsModels.Posts.ViewModel, on queu: DispatchQueue) {
        isFunctionWasCalled = true
    }
    
    func displayError(viewModel: CaibaModels.Error.ViewModel, on queu: DispatchQueue) {
        isFunctionWasCalled = true
    }
}
