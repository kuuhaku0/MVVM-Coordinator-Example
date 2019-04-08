//
//  SecondFlowCoordinator.swift
//  Coordinator
//
//  Created by Zhao, Tyler on 4/8/19.
//  Copyright © 2019 Zhao, Tyler. All rights reserved.
//

import UIKit

class SecondFlowCoordinator: Coordinator {
    
    var rootViewController: UIViewController {
        return tabBarController
    }
    
    // Ideally this should be the rootViewController's ViewModel and is injected directly into rootVC
    // textToDisplay is for demo purposes
    var textToDisplay: String = ""
    
    let tabBarController: UITabBarController
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    
    var goToFirstTrigger: (()->Void)?
    
    func start() {
        assembleTabs()
    }
    
    func assembleTabs() {
        tabBarController.viewControllers = [showSecondFlow()]
    }
    
    func showSecondFlow() -> UIViewController {
        let vc = SecondViewController.instantiate()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        let vm = SecondViewModel(displayText: self.textToDisplay,
                                 goToFirstTrigger: goToFirstTrigger)
        vc.viewModel = vm
        return vc
    }
    
    deinit {
        print("\(String(describing: self)) is deallocated)")
    }
}
