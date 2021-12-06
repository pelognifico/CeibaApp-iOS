//
//  MainWorker.swift
//  CeibaApp-IOS
//
//  Created by UnLimited on 3/12/21.
//

import Foundation

protocol MainServiceProtocol {
    func getMain(request: CaibaModels.GetMain.Request, completion: @escaping (Result<[CaibaModels.GetMain.Response], CaibaError>) -> Void)
    
    func postsMainDetails(request: CaibaDetailsModels.Posts.Request, completion: @escaping (Result<[CaibaDetailsModels.Posts.Response], CaibaError>) -> Void)
}

class MainWorker: MainServiceProtocol{


    var mainService: MainServiceProtocol
    
    init(mainService: MainServiceProtocol = CaibaAPI()) {
        self.mainService = mainService
    }
    
    
    func getMain(request: CaibaModels.GetMain.Request, completion: @escaping (Result<[CaibaModels.GetMain.Response], CaibaError>) -> Void) {
        mainService.getMain(request: request, completion: { result in
            completion(result)
        })
    }
    
    func postsMainDetails(request: CaibaDetailsModels.Posts.Request, completion: @escaping (Result<[CaibaDetailsModels.Posts.Response], CaibaError>) -> Void) {
        mainService.postsMainDetails(request: request, completion: { result in
            completion(result)
        })
    }
    

}
