//
//  SecondViewController.swift
//  Coordinator
//
//  Created by Zhao, Tyler on 4/8/19.
//  Copyright © 2019 Zhao, Tyler. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    @IBAction func buttonAction(_ sender: UIButton) {
        viewModel.validateSignIn(isValid: true)
    }
    
    var viewModel: SecondViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        label.text = viewModel.displayText
    }
    
    deinit {
        print("\(String(describing: self)) is deallocated)")
    }
}
