//
//  SecondViewModel.swift
//  Coordinator
//
//  Created by Zhao, Tyler on 4/8/19.
//  Copyright © 2019 Zhao, Tyler. All rights reserved.
//

import Foundation

struct SecondViewModel {
    
    let displayText: String
    
    var goToFirstTrigger: (()->Void)?
    
    func validateSignIn(isValid: Bool) {
        if isValid { goToFirstTrigger?() }
        else {
            RootViewController.shared.displayError()
        }
    }

}
