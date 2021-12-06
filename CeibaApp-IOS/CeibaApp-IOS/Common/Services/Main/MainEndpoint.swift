//
//  MainEndpoint.swift
//  CeibaApp-IOS
//
//  Created by UnLimited on 3/12/21.
//

import Alamofire


enum MainEndpoint {
    case getUser
    case postDetails
}

extension MainEndpoint: IEndpoint {
    
    var method: HTTPMethod {
        
        switch self {
        case .getUser, .postDetails:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getUser:
            return "users"
        case .postDetails:
            return "posts"
        }
        
    }
    
    var parameter: Parameters? {
        switch self {
        case .getUser:
            return nil
            
        case .postDetails:
            return nil
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        default:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
}
