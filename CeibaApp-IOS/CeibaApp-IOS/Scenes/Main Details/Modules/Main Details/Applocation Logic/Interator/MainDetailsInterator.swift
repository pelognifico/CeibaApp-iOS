//
//  MainDetailsInterator.swift
//  CeibaApp-IOS
//
//  Created by UnLimited on 3/12/21.
//

import Foundation

protocol MainDetailsBusinessLogic {
    func loadInitialData(request: CaibaDetailsModels.Posts.Request)
}

protocol MainDetailsDataStore {
}

class MainDetailsInteractor: MainDetailsBusinessLogic, MainDetailsDataStore {
    
    var presenter: MainDetailsPresentationLogic?
    
    var worker: MainServiceProtocol
    
    init(worker: MainServiceProtocol = MainWorker()) {
        self.worker = worker
    }
  
    // MARK: Load Initial Data
    func loadInitialData(request: CaibaDetailsModels.Posts.Request) {
        worker.postsMainDetails(request: request) { result in
            switch result {
            case .success(let response):
                self.presenter?.presentInitialData(response: response)
            case .failure(let error):
                let response = CaibaModels.Error.Response(error: error)
                self.presenter?.presentError(response: response)
            }
        }
    }
}
