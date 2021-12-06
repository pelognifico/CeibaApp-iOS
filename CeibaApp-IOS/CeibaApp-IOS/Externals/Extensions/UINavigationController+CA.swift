//
//  UINavigationController+CA.swift
//  CeibaApp-IOS
//
//  Created by UnLimited on 2/12/21.
//

import UIKit

extension UINavigationController {
    func removeViewController(_ controller: UIViewController.Type) {
        if let viewController = viewControllers.first(where: { $0.isKind(of: controller.self) }) {
            viewController.removeFromParent()
        }
    }
        
    func clearBackground(){
        
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.navigationBar.backgroundColor = .green
        self.view.backgroundColor = .green
    }
    
    func setBackground(){
        
        let color: UIColor = #colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1)
                
                self.navigationBar.setBackgroundImage(UIImage(), for: .default)
                self.navigationBar.shadowImage = UIImage()
                self.navigationBar.isTranslucent = false
                self.navigationBar.backgroundColor = color
                self.navigationBar.barTintColor = color
                self.view.backgroundColor = color
        
    }

}
