//
//  MainPresenter.swift
//  CeibaApp-IOS
//
//  Created by UnLimited on 3/12/21.
//
import Foundation

protocol MainPresentationLogic {
    func presentInitialData(response: [CaibaModels.GetMain.Response])
    func presentError(response: CaibaModels.Error.Response)
}

class MainPresenter: MainPresentationLogic {
    weak var viewController: MainDisplayLogic?
  
    // MARK: - Present Initial Data
    func presentInitialData(response: [CaibaModels.GetMain.Response]) {
        let viewModel = CaibaModels.GetMain.ViewModel(caibaData: response)
        viewController?.displayInitialData(viewModel: viewModel, on: .main)
    }
    
    //MARK: - Present error
    func presentError(response: CaibaModels.Error.Response){
        let viewModel = CaibaModels.Error.ViewModel(error: response.error)
        viewController?.displayError(viewModel: viewModel, on: .main)
    }
}
