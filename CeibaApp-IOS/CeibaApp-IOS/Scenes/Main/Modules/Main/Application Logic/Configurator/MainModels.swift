//
//  MainModels.swift
//  CeibaApp-IOS
//
//  Created by UnLimited on 3/12/21.
//

import Foundation

enum CaibaModels {
    enum GetMain {
        struct Request: Codable {
            //
        }

        struct Response: Codable {
            // MARK: - DataClass
            struct DataClass: Codable {
                
            }
            
            let id        : Int?
            let name      : String?
            let email     : String?
            let phone     : String?

            enum CodingKeys: String, CodingKey {
                case id
                case name
                case email
                case phone
            }
        }

        struct ViewModel {
            let caibaData : [CaibaModels.GetMain.Response]
        }
    }

    enum Error {
        struct Request {
        }
        struct Response {
            var error: CaibaError
        }
        struct ViewModel {
            var error: CaibaError
        }
    }
}
