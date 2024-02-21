//
//  SampleViewController.swift
//  Clean-Architecture
//
//  Created by TTB on 13/2/2567 BE.
//  Copyright (c) 2567 BE TTB. All rights reserved.
//

import UIKit

typealias SampleRouterInterface = SampleRouterProtocol & SampleDataPassingProtocol

protocol SampleViewControllerProtocol: AnyObject {
    
}

class SampleViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    // MARK: - Public Properties
    var interactor: SampleInteractorProtocol!
    var router: SampleRouterInterface!
    
    // MARK: - Private Properties
    
    // MARK: - View Life Cycle Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Method Private
    
}

// MARK: - SampleViewControllerProtocol
extension SampleViewController: SampleViewControllerProtocol {
    
}
