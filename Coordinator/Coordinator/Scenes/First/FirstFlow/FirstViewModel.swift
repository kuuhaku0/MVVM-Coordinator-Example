//
//  FirstViewModel.swift
//  Coordinator
//
//  Created by Zhao, Tyler on 4/8/19.
//  Copyright © 2019 Zhao, Tyler. All rights reserved.
//

import Foundation

struct FirstViewModel {
    
    var goToSecondTrigger: (()->Void)?
    var nextAction: ((String)->Void)?

    func determinePaths() {
        goToSecondTrigger?()
    }

}
