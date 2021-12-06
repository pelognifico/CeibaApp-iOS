//
//  MainDetailsRouter.swift
//  CeibaApp-IOS
//
//  Created by UnLimited on 3/12/21.
//

import Foundation

@objc protocol MainDetailsRoutingLogic {
}

protocol MainDetailsDataPassing {
    var dataStore: MainDetailsDataStore? { get }
}

protocol MainDetailsRouterDelegate: AnyObject {
}

class MainDetailsRouter: NSObject, MainDetailsRoutingLogic, MainDetailsDataPassing {
    
    weak var viewController: MailnDetailsViewController?
    var dataStore: MainDetailsDataStore?
    weak var delegate: MainDetailsRouterDelegate?
  
}
