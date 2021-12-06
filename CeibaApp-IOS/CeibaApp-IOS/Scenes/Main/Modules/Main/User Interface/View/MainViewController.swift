//
//  MainViewController.swift
//  CeibaApp-IOS
//
//  Created by UnLimited on 2/12/21.
//

import UIKit

protocol MainDisplayLogic: AnyObject {
    func displayInitialData(viewModel: CaibaModels.GetMain.ViewModel, on queu: DispatchQueue)
    func displayError(viewModel: CaibaModels.Error.ViewModel, on queu: DispatchQueue)
}

class MainViewController: BaseViewController {
    
    @IBOutlet weak var searchTextField: CMTextField!{
    didSet {
        searchTextField?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        }
    }
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var emtyLabel: UILabel!
    
    let cellNibName = "MainTableViewCell"
    
    private var isFiltering:Bool{
        return searchTextField?.text?.isEmpty == false
    }
    
    var data: [CaibaModels.GetMain.Response]?
    
    var dataFilter: [CaibaModels.GetMain.Response] = [] {
        didSet {
            listTableView.reloadData()
        }
    }
    
    var interactor: MainBusinessLogic?
    var router: (NSObjectProtocol & MainRoutingLogic & MainDataPassing)?

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
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = LottosRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsNavBar()
        settingTableView()
        loadInitialData()
        
        listTableView.rowHeight = UITableView.automaticDimension
        listTableView.estimatedRowHeight = 300
        listTableView.delegate = self
        listTableView.dataSource = self
        
        searchTextField.borderColor = .gray
        
    }
    
    private func search() {
        if let text = searchTextField?.text?.lowercased() {
            dataFilter = (data?.filter({ (record) -> Bool in
                return (record.name?.lowercased().contains(text))!
            }))!
        }
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        search()
        if dataFilter.count == 0 && textField.text != "" {
            emtyLabel.isHidden = false
            listTableView.isHidden = true
        } else {
            emtyLabel.isHidden = true
            listTableView.isHidden = false
        }
        
    }
    
   //MARK: - Methods
    func loadInitialData() {

        let request = CaibaModels.GetMain.Request()
        interactor?.loadInitialData(request: request)
    }
    
    private func settingTableView() {
        listTableView.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: MainTableViewCell.reuseIdentifier)

        listTableView.rowHeight = UITableView.automaticDimension
        listTableView.estimatedRowHeight = 170

    }

}
    
    

// MARK: - HomeDisplayLogic
extension MainViewController: MainDisplayLogic {
    func displayInitialData(viewModel: CaibaModels.GetMain.ViewModel, on queu: DispatchQueue = .main) {
        
        data = viewModel.caibaData

        listTableView.reloadData()
    }
    
    func displayError(viewModel: CaibaModels.Error.ViewModel, on queu: DispatchQueue = .main) {

        displaySimpleAlert(with: "Error", message: viewModel.error.description)
    }
}



//MARK: -Delegate
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return isFiltering ? dataFilter.count : data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listTableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier, for: indexPath) as? MainTableViewCell else { fatalError() }
        
        if let users = data?[indexPath.row] {
        
            cell.configUI(user: users)
            
        }
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewCtrl = MailnDetailsViewController()
        
        viewCtrl.dataUser = data?[indexPath.row]
        
        self.navigationController?.pushViewController(viewCtrl, animated: true)
    }
    
}
