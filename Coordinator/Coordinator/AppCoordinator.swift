//
//  AppCoordinator.swift
//  Coordinator
//
//  Created by Zhao, Tyler on 4/8/19.
//  Copyright © 2019 Zhao, Tyler. All rights reserved.
//

import UIKit

protocol Coordinator {
    func start()
    var rootViewController: UIViewController { get }
}

class AppCoordinator {
    
    enum Coordinate {
        case first
        case second(String?)
    }
    
    private(set) var currentCoordinator: Coordinator?
    private let rootViewController: RootViewController

    init(rootVC: RootViewController) {
        self.rootViewController = rootVC
    }
    
    func start() {
        coordinate()
    }

    private func coordinate(to destination: Coordinate = .first) {
        var coordinator: Coordinator!
        switch destination {
        case .first: coordinator = assembleFirstCoordinator()
        case .second(let text): coordinator = assembleSecondCoordinator(text: text)
        }
        currentCoordinator = coordinator
        rootViewController.currentFlow = coordinator.rootViewController
        coordinator?.start()
    }
    
    // MARK: Coordinates
    private func assembleFirstCoordinator() -> Coordinator {
        let navigationController = UINavigationController()
        let firstCoordinator = FirstFlowCoordinator(navigationController: navigationController)
        
        firstCoordinator.goToSecondTrigger = {
            [weak self] in
            self?.coordinate(to: .second(nil))
        }
        
        firstCoordinator.flowCompleteGoNext = {
            [weak self] in
            self?.coordinate(to: .second($0))
        }
        return firstCoordinator
    }
    
    private func assembleSecondCoordinator(text: String?) -> Coordinator {
        let tabBarController = UITabBarController()
        let secondCoordinator = SecondFlowCoordinator(tabBarController: tabBarController)
        
        // Ideally inject this as model to whatever root controller
        secondCoordinator.textToDisplay = text ?? ""
        
        
        secondCoordinator.goToFirstTrigger = {
            [weak self] in
            self?.coordinate(to: .first)
        }
        return secondCoordinator
    }

}
