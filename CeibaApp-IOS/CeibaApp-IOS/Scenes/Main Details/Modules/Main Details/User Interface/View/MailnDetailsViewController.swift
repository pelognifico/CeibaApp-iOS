//
//  MailnDetailsViewController.swift
//  CeibaApp-IOS
//
//  Created by UnLimited on 3/12/21.
//

import UIKit


protocol MainDetailsDisplayLogic: AnyObject {
    func displayInitialData(viewModel: CaibaDetailsModels.Posts.ViewModel, on queu: DispatchQueue)
    func displayError(viewModel: CaibaModels.Error.ViewModel, on queu: DispatchQueue)
}

class MailnDetailsViewController: BaseViewController {
    
    @IBOutlet weak var detailTable: UITableView!
    @IBOutlet weak var nameUserLabel: UILabel!
    @IBOutlet weak var EmailDetailsLabel: UILabel!
    @IBOutlet weak var numberDetailsLabel: UILabel!
    
    
    let cellNibName = "MainDetailsTableViewCell"
    
    var dataUser: CaibaModels.GetMain.Response?
    var dataDetails: [CaibaDetailsModels.Posts.Response]?
    var idUser: Int?
    
    var interactor: MainDetailsBusinessLogic?
    var router: (NSObjectProtocol & MainDetailsRoutingLogic & MainDetailsDataPassing)?
    
    // MARK: - Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
  
    // MARK: - Setup
    private func setup() {
        let viewController = self
        let interactor = MainDetailsInteractor()
        let presenter = MainDetailsPresenter()
        let router = MainDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialData()
    }

    
    private func initialData(){
        
        settingsNavBar()
        settingTableView()
        loadInitialData()
        setupBackButton(title: "Back")
        
        nameUserLabel.text = dataUser?.name
        numberDetailsLabel.text = dataUser?.phone
        EmailDetailsLabel.text = dataUser?.email
        
        
        detailTable.rowHeight = UITableView.automaticDimension
        detailTable.estimatedRowHeight = 300
        detailTable.delegate = self
        detailTable.dataSource = self
    }
    
    
    //MARK: - Methods
     func loadInitialData() {
         
         let request = CaibaDetailsModels.Posts.Request()
         interactor?.loadInitialData(request: request)
     }
     
     private func settingTableView() {
         detailTable.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: MainDetailsTableViewCell.reuseIdentifier)

         detailTable.rowHeight = UITableView.automaticDimension
         detailTable.estimatedRowHeight = 170

     }
}


//MARK: -Delegate
extension MailnDetailsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return dataDetails?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = detailTable.dequeueReusableCell(withIdentifier: MainDetailsTableViewCell.reuseIdentifier, for: indexPath) as? MainDetailsTableViewCell else { fatalError() }

        if let users = dataDetails?[indexPath.row] {
            cell.configUI(user: users)
        }
        return cell
    }
}

// MARK: - HomeDisplayLogic
extension MailnDetailsViewController: MainDetailsDisplayLogic {

 
    func displayInitialData(viewModel: CaibaDetailsModels.Posts.ViewModel, on queu: DispatchQueue = .main) {
//        hideLoading()
        
        dataDetails = viewModel.detailsData.filter { $0.userId == dataUser?.id }
        
        detailTable.reloadData()
    }
    
    func displayError(viewModel: CaibaModels.Error.ViewModel, on queu: DispatchQueue) {
        displaySimpleAlert(with: "Error", message: viewModel.error.description)
    }
    
}

