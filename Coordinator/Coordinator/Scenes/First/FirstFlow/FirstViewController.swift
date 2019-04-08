//
//  FirstViewController.swift
//  Coordinator
//
//  Created by Zhao, Tyler on 4/8/19.
//  Copyright © 2019 Zhao, Tyler. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var triggerButton: UIButton!
    
    @IBAction func nextAction(_ sender: UIButton) {
        viewModel.nextAction?("Welcome ")
    }
    
    @IBAction func triggerAction(_ sender: UIButton) {
        viewModel.determinePaths()
    }
    
    var viewModel: FirstViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
    }
    
    deinit {
        print("\(String(describing: self)) is deallocated)")
    }
}

extension UIViewController: StoryboardLoadable { }
