//
//  RootViewController.swift
//  Coordinator
//
//  Created by Zhao, Tyler on 4/8/19.
//  Copyright © 2019 Zhao, Tyler. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    static let shared: RootViewController = RootViewController.instantiateVC()
    
    var currentFlow: UIViewController = UIViewController() {
        didSet {
            remove(child: oldValue)
            add(child: currentFlow, to: view)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
    
    // MARK: Initializers
    init() { super.init(nibName: nil, bundle: nil) }
    required init?(coder aDecoder: NSCoder) { return nil }
    
    private static func instantiateVC() -> RootViewController {
        return RootViewController()
    }
}

extension UIViewController {
    
    public func add(child viewController: UIViewController, to view: UIView, frame: CGRect? = nil) {
        addChild(viewController)
        viewController.view.frame = frame ?? view.bounds
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
    
    public func remove(child viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
    public func animateFadeTransition(to new: UIViewController, from previous: UIViewController) {
        previous.willMove(toParent: nil)
        addChild(new)
        transition(from: previous, to: new, duration: 0.3, options: [.transitionCrossDissolve, .curveEaseOut], animations: {
            
        }) { completed in
            previous.removeFromParent()
            new.didMove(toParent: self)
        }
    }
}

extension UIViewController {
    
    public func displayError() {
        let alertVc = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        
        alertVc.title = "Error"
        alertVc.message = "Random Error Message!"
        alertVc.addAction(UIAlertAction.init(title: "OK", style: .cancel))
        
        DispatchQueue.main.async {
            self.present(alertVc, animated: true, completion: nil)
        }
    }
    
}
