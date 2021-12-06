//
//  MainDetailsPresenter.swift
//  CeibaApp-IOS
//
//  Created by UnLimited on 3/12/21.
//

import Foundation

protocol MainDetailsPresentationLogic {
    func presentInitialData(response: [CaibaDetailsModels.Posts.Response])
    func presentError(response: CaibaModels.Error.Response)
}

class MainDetailsPresenter: MainDetailsPresentationLogic {

    weak var viewController: MainDetailsDisplayLogic?
  
    // MARK: - Present Initial Data
    func presentInitialData(response: [CaibaDetailsModels.Posts.Response]) {
        let viewModel = CaibaDetailsModels.Posts.ViewModel(detailsData: response)
        viewController?.displayInitialData(viewModel: viewModel, on: .main)
    }
    
    //MARK: - Present error
    func presentError(response: CaibaModels.Error.Response){
        let viewModel = CaibaModels.Error.ViewModel(error: response.error)
        viewController?.displayError(viewModel: viewModel, on: .main)
    }
}
