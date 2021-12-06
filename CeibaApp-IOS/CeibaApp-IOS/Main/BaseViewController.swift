//
//  BaseViewController.swift
//  CeibaApp-IOS
//
//  Created by UnLimited on 2/12/21.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func settingsNavBar() {
        
        let title = "Prueba de Ingreso"
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 165, height: 40))
      
        navigationController?.setBackground()
        titleView.backgroundColor = .green
        
        navigationItem.title = title
    }
    
    func setupBackButton(title: String) {
        let backButtonItem: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "backArrow"),
                                                              style: .plain,
                                                              target: self,
                                                              action: #selector(self.backButtonClickedDismiss(sender:)))
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        let labelText = UILabel()
        
        labelText.text = title.uppercased()
        labelText.font = UIFont(name: "Roboto-Medium", size: 14)
        labelText.textAlignment = .left
        
        self.navigationItem.leftBarButtonItem  = backButtonItem
        
        labelText.frame = CGRect(x: 0, y: 0, width: 300, height: 40)

        titleView.addSubview(labelText)
        titleView.backgroundColor = .clear
        
        self.navigationItem.titleView = titleView
        
    }
    
    @objc func backButtonClickedDismiss(sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Alert
extension BaseViewController {
    func displaySimpleAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
