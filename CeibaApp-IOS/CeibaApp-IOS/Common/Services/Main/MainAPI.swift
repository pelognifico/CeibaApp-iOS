//
//  MainAPI.swift
//  CeibaApp-IOS
//
//  Created by UnLimited on 3/12/21.
//

import Foundation

class CaibaAPI: MainServiceProtocol {
    
    func getMain(request: CaibaModels.GetMain.Request, completion: @escaping (Result<[CaibaModels.GetMain.Response], CaibaError>) -> Void) {
        NetworkService.share.request(endpoint: MainEndpoint.getUser) { result in
            switch result {
            case .success:
                do {
                    let data = try result.get()
                    let response = try JSONDecoder().decode([CaibaModels.GetMain.Response].self, from: data!)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(.parse(error)))
                }
            case .failure(let error):
                completion(.failure(.network(error)))
            }
        }
    }
    
    func postsMainDetails(request: CaibaDetailsModels.Posts.Request, completion: @escaping (Result<[CaibaDetailsModels.Posts.Response], CaibaError>) -> Void) {
        NetworkService.share.request(endpoint: MainEndpoint.postDetails) { result in
            switch result {
            case .success:
                do {
                    let data = try result.get()
                    let response = try JSONDecoder().decode([CaibaDetailsModels.Posts.Response].self, from: data!)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(.parse(error)))
                }
            case .failure(let error):
                completion(.failure(.network(error)))
            }
        }
    }
}
