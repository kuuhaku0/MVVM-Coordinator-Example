//
//  FirstFlowCoordinator.swift
//  Coordinator
//
//  Created by Zhao, Tyler on 4/8/19.
//  Copyright © 2019 Zhao, Tyler. All rights reserved.
//

import UIKit

class FirstFlowCoordinator: Coordinator {
    
    var rootViewController: UIViewController {
        return navigationController
    }
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    var goToSecondTrigger: (() -> Void)?
    var flowCompleteGoNext: ((String) -> Void)?
    
    // Ideally This would be in the Coordinator's rootVC's viewModel
    var completeString = "" {
        didSet {
            print(completeString)
        }
    }
    
    func start() {
        showFirstFlow()
    }
    
    func showFirstFlow() {
        let vc = FirstViewController.instantiate()
        let vm = FirstViewModel(goToSecondTrigger: goToSecondTrigger,
                                nextAction: { [weak self] (text) in
                                    self?.completeString += text
                                    self?.showScreen2()
        })
        vc.viewModel = vm
        
        navigationController.show(vc, sender: self)
    }
    
    func showScreen2() {
        let vc = ScreenTwoViewController.instantiate(fromStoryboardNamed: "FirstViewController")
        let vm = ScreenTwoViewModel { [weak self] (text) in
            // Ideally you would call rootVC.viewModel.update(data: #YourData#)
            self?.completeString += text
            self?.showScreen3()
        }
        vc.viewModel = vm
        navigationController.show(vc, sender: self)
    }
    
    func showScreen3() {
        let vc = ScreenThreeViewController.instantiate(fromStoryboardNamed: "FirstViewController")
        let vm = ScreenThreeViewModel { [weak self] (text) in
            // Ideally you would call rootVC.viewModel.update(data: #YourData#)
            self?.completeString += text
            self?.flowCompleteGoNext?(self?.completeString ?? "")
        }
        vc.viewModel = vm
        navigationController.show(vc, sender: self)
    }
    
    deinit {
        print("\(String(describing: self)) is deallocated)")
    }
}
