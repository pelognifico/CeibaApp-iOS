//
//  GeneralRoute.swift
//  CeibaApp-IOS
//
//  Created by UnLimited on 3/12/21.
//

import Foundation
import UIKit

enum GeneralRoute: IRouter {
    case main
    
}

extension GeneralRoute {
    var scene: UIViewController? {
        switch self {
        case .main:
            return MainViewController()
        }
    }
}
