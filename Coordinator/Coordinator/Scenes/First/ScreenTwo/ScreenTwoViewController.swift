//
//  ScreenTwoViewController.swift
//  Coordinator
//
//  Created by Zhao, Tyler on 4/8/19.
//  Copyright © 2019 Zhao, Tyler. All rights reserved.
//

import UIKit

class ScreenTwoViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func nextAction(_ sender: UIButton) {
        viewModel.nextAction?(label.text! + " ")
    }
    
    var viewModel: ScreenTwoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
