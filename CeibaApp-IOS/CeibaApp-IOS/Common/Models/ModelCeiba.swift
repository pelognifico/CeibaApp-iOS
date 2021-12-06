//
//  ModelCeiba.swift
//  CeibaApp-IOS
//
//  Created by UnLimited on 3/12/21.
//

import Foundation

struct Users: Codable {
    let id        : Int?
    let name      : String?
    let email     : String?
    let phone     : String?
}

struct Posts: Codable {
    let userId  : String?
    let id      : Int?
    let title   : String?
    let body    : String?
}
