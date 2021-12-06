//
//  MainError.swift
//  CeibaApp-IOS
//
//  Created by UnLimited on 3/12/21.
//


import Foundation

enum CaibaError: Error, CustomStringConvertible {
    case request
    case network(Error)
    case parse(Error)
    case server(description: String)
    
    var description: String {
        switch self {
        case .network(let error), .parse(let error):
            return error.localizedDescription
        case .request:
            return "Error request"
        case .server(let description):
            return description
        }
    }
}


