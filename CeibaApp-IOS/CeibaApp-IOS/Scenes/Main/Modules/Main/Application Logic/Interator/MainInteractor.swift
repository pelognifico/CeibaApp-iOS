//
//  MainInteractor.swift
//  CeibaApp-IOS
//
//  Created by UnLimited on 3/12/21.
//

import Foundation

protocol MainBusinessLogic {
    func loadInitialData(request: CaibaModels.GetMain.Request)
}

protocol MainDataStore {  }

class MainInteractor: MainBusinessLogic, MainDataStore {
    
    var presenter: MainPresentationLogic?
    
    var worker: MainServiceProtocol
    
    init(worker: MainServiceProtocol = MainWorker()) {
        self.worker = worker
    }
  
    // MARK: Load Initial Data
    func loadInitialData(request: CaibaModels.GetMain.Request) {
        worker.getMain(request: request) { result in
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
