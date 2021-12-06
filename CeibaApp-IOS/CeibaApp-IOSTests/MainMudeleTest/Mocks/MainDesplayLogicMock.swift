//
//  MainDesplayLogicMock.swift
//  CeibaApp-IOSTests
//
//  Created by UnLimited on 4/12/21.
//

import XCTest
@testable import CeibaApp_IOS

final class MainDesplayLogicMock: MainDisplayLogic{

    var viewModelDisplay: CaibaModels.GetMain.ViewModel?

       var isFunctionWasCalled = false
       
    func displayInitialData(viewModel: CaibaModels.GetMain.ViewModel, on queu: DispatchQueue) {
        isFunctionWasCalled = true
    }
       
    func displayError(viewModel: CaibaModels.Error.ViewModel, on queu: DispatchQueue) {
           isFunctionWasCalled = true
       }

}
