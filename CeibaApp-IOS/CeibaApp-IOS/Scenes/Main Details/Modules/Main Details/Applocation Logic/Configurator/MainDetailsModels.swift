//
//  MainDetailsModels.swift
//  CeibaApp-IOS
//
//  Created by UnLimited on 3/12/21.
//

import Foundation

enum CaibaDetailsModels {
    enum Posts {
        struct Request: Codable {
            //
        }

        struct Response: Codable {
            // MARK: - DataClass
            struct DataClass: Codable {
                
            }
            
            let userId      : Int?
            let id          : Int?
            let title       : String?
            let body        : String?

            enum CodingKeys: String, CodingKey {
                case userId
                case id
                case title
                case body
            }
        }

        struct ViewModel {
            let detailsData : [CaibaDetailsModels.Posts.Response]
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
